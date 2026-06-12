import 'package:flutter/foundation.dart';
import 'package:eventer/models/event_model.dart';

class EventProvider extends ChangeNotifier {
  List<Event> _events = [];
  List<Event> _favoriteEvents = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Event> get events => _events;
  List<Event> get favoriteEvents => _favoriteEvents;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Mock data - replace with API calls later
  void loadMockEvents() {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Simulate API delay
    Future.delayed(const Duration(seconds: 1), () {
      _events = [
        Event(
          id: '1',
          title: 'Downtown Yard Sale',
          description: 'Big yard sale with furniture, electronics, and more!',
          eventType: 'yard_sale',
          location: 'Austin, TX',
          latitude: 30.2672,
          longitude: -97.7431,
          startDate: DateTime.now().add(const Duration(days: 1)),
          endDate: DateTime.now().add(const Duration(days: 1, hours: 6)),
          contactPhone: '(512) 555-0123',
          attendees: 45,
        ),
        Event(
          id: '2',
          title: 'Classic Car Show 2024',
          description: 'Vintage and classic cars exhibition. Free admission!',
          eventType: 'car_show',
          location: 'San Francisco, CA',
          latitude: 37.7749,
          longitude: -122.4194,
          startDate: DateTime.now().add(const Duration(days: 3)),
          endDate: DateTime.now().add(const Duration(days: 3, hours: 8)),
          contactPhone: '(415) 555-0456',
          attendees: 120,
        ),
        Event(
          id: '3',
          title: 'Local Street Vendors Market',
          description: 'Pop-up market with local food, crafts, and art',
          eventType: 'pop_up',
          location: 'New York, NY',
          latitude: 40.7128,
          longitude: -74.0060,
          startDate: DateTime.now().add(const Duration(days: 2)),
          endDate: DateTime.now().add(const Duration(days: 2, hours: 5)),
          contactEmail: 'info@streetmarket.com',
          attendees: 200,
        ),
      ];
      _isLoading = false;
      notifyListeners();
    });
  }

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }

  void updateEvent(Event event) {
    final index = _events.indexWhere((e) => e.id == event.id);
    if (index != -1) {
      _events[index] = event;
      notifyListeners();
    }
  }

  void deleteEvent(String eventId) {
    _events.removeWhere((e) => e.id == eventId);
    notifyListeners();
  }

  void toggleFavorite(String eventId) {
    final index = _events.indexWhere((e) => e.id == eventId);
    if (index != -1) {
      final event = _events[index];
      final updatedEvent = event.copyWith(isFavorite: !event.isFavorite);
      _events[index] = updatedEvent;

      if (updatedEvent.isFavorite) {
        _favoriteEvents.add(updatedEvent);
      } else {
        _favoriteEvents.removeWhere((e) => e.id == eventId);
      }

      notifyListeners();
    }
  }

  List<Event> searchEvents(String query) {
    return _events
        .where((event) =>
            event.title.toLowerCase().contains(query.toLowerCase()) ||
            event.location.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<Event> filterByEventType(String eventType) {
    return _events.where((event) => event.eventType == eventType).toList();
  }
}