import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferenceSourceBase {
  final SharedPreferences preferences;

  PreferenceSourceBase(this.preferences);

  Future<List<Element>> getElemntList<Element>(
    String key, {
    required Element Function(Map<String, dynamic>) fromJson,
  }) async {
    return (preferences.getStringList(key) ?? [])
        .map((e) => fromJson(json.decode(e)))
        .toList();
  }

  Future<List<Element>> setElementList<Element>(
    String key, {
    required List<Element> list,
    required Map<String, dynamic> Function(Element element) toJson,
  }) async {
    final datas = list.map((e) => json.encode(toJson(e))).toList();
    await preferences.setStringList(key, datas);
    return list;
  }

  Future<Element?> getElemnt<Element>(
    String key, {
    required Element Function(Map<String, dynamic>) fromJson,
  }) async {
    final data = preferences.getString(key);
    if (data == null) return null;
    return fromJson(json.decode(data));
  }

  Future<Element> setElement<Element>(
    String key, {
    required Element element,
    required Map<String, dynamic> Function(Element element) toJson,
  }) async {
    final data = json.encode(toJson(element));
    await preferences.setString(key, data);
    return element;
  }
}
