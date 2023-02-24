import 'package:chef_timer/data/datasources/preferences/preference_source.dart';
import 'package:chef_timer/data/datasources/preferences/preference_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initProviders() async {
  final preference =
      PreferenceSourceImpl(await SharedPreferences.getInstance());
  PreferenceSource.provider = Provider((ref) => preference);
}
