import 'package:yota/data/datasources/preferences/preference_source.dart';
import 'package:yota/data/datasources/preferences/preference_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Providers {
  static Future<void> initialize() async {
    final preference =
        PreferenceSourceImpl(await SharedPreferences.getInstance());
    await preference.initialize();

    PreferenceSource.provider = Provider((ref) => preference);
  }
}
