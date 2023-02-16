extension FutureDateTime on DateTime {
  // TODO: ..?? not working.
  static DateTime futureFrom(int seconds) =>
      DateTime.now().add(Duration(seconds: seconds));
}
