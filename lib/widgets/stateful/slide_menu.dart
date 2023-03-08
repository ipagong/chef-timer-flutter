import 'package:yota/utils/indexed_iterable.dart';
import 'package:flutter/material.dart';

typedef SelectSlideMenu = void Function(int index);

class SlideMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> menuItems;
  final SelectSlideMenu onSelected;
  final double? menuWidth;

  const SlideMenu(
      {Key? key,
      required this.child,
      required this.menuItems,
      required this.onSelected,
      this.menuWidth})
      : super(key: key);

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double get menuOffset => widget.menuWidth == null
      ? -0.2
      : -(widget.menuWidth! / MediaQuery.of(context).size.width);

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 150),
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Here the end field will determine the size of buttons which will appear after sliding
    //If you need to appear them at the beginning, you need to change to "+" Offset coordinates (0.2, 0.0)
    final animation = Tween(
      begin: const Offset(0.0, 0.0),
      end: Offset(menuOffset * widget.menuItems.length, 0),
    ).animate(
      CurveTween(curve: Curves.decelerate).animate(_controller),
    );

    return GestureDetector(
      onHorizontalDragUpdate: (data) {
        // we can access context.size here
        setState(() {
          //Here we set value of Animation controller depending on our finger move in horizontal axis
          //If you want to slide to the right, change "-" to "+"
          _controller.value -=
              (data.primaryDelta! / (context.size!.width * 0.2));
        });
      },
      onHorizontalDragEnd: (data) {
        if (data.primaryVelocity! > 1500) {
          //To change slide direction, change to data.primaryVelocity! < -1500
          //close menu on fast swipe in the right direction
          _controller.animateTo(.0);
        } else if (_controller.value >= .5 || data.primaryVelocity! < -1500) {
          // To change slide direction, change to data.primaryVelocity! > 1500
          // fully open if dragged a lot to left or on fast swipe to left
          _controller.animateTo(1.0);
        } else {
          // close if none of above
          _controller.animateTo(.0);
        }
      },
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Stack(
            children: [
              SlideTransition(
                position: animation,
                child: widget.child,
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  //To change slide direction to right, replace the right parameter with left:
                  return Positioned(
                    right: .0,
                    top: .0,
                    bottom: .0,
                    width: constraint.maxWidth * animation.value.dx * -1,
                    child: Row(
                      children: widget.menuItems.mapIndexed(
                        (child, index) {
                          return Expanded(
                              child: InkWell(
                                  onTap: () {
                                    _controller.reverse();
                                    widget.onSelected(index);
                                  },
                                  child: child));
                        },
                      ).toList(),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
