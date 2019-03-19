import 'package:tracking_layer/event.dart';
import 'package:tracking_layer/tracker.dart';
import 'dart:collection';

class EventDispatcher extends EventTracker<Event> {

  LinkedHashMap<Event, EventTracker> eventTrackers = LinkedHashMap<Event, EventTracker>();

  void addTracker(Event eventType, EventTracker tracker) {
    eventTrackers[eventType] = tracker;
  }

  @override
  Future<void> sendEvent(Event event) {
    for (var key in eventTrackers.keys) {
      for (var value in eventTrackers.values) {
        if (key.runtimeType == event.runtimeType) {
          (value as EventTracker<Event>).sendEvent(event);
        }
      }
    }
  }
}
