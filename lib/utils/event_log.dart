// ignore_for_file: constant_identifier_names

import 'package:firebase_analytics/firebase_analytics.dart';

enum Event {
  push_timer_template,
  push_timer_screen,
  delete_active_timer,
  toggle_active_timer,
  reset_active_timer,
  lock_active_timer,
  create_custom_timer,
}

class EventLog {
  static Future<void> send({
    required Event event,
    Map<String, Object?>? parameters,
  }) =>
      FirebaseAnalytics.instance
          .logEvent(name: event.name, parameters: parameters);
}
