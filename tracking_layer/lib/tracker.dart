import 'package:tracking_layer/event.dart';

abstract class EventTracker<Event> {
  Future<void> sendEvent(Event event);
}