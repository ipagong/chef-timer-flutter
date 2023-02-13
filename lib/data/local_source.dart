import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LocalSourceKey { favoriteTimers }

extension LocalSourceKeyString on LocalSourceKey {
  String get rawValue {
    switch (this) {
      case LocalSourceKey.favoriteTimers:
        return "favorite_timers";
    }
  }
}

abstract class LocalSource {
  static late final Provider<LocalSource> provider;

  Future<List<String>> getFavoriteTimers();
  Future<List<String>> addFavoriteTimer(String timer);
  Future<List<String>> removeFavoriteTimer(String timer);
}

class LocalSourceImpl extends LocalSource {
  final SharedPreferences _prefs;
  LocalSourceImpl(this._prefs);

  @override
  Future<List<String>> getFavoriteTimers() async {
    return _prefs.getStringList(LocalSourceKey.favoriteTimers.rawValue) ?? [];
  }

  @override
  Future<List<String>> addFavoriteTimer(String timer) async {
    return await getFavoriteTimers()
      ..add(timer);
  }

  @override
  Future<List<String>> removeFavoriteTimer(String timer) async {
    var timers = await getFavoriteTimers()
      ..removeWhere((e) => e == timer);
    _prefs.setStringList(LocalSourceKey.favoriteTimers.rawValue, timers);
    return timers;
  }
}
