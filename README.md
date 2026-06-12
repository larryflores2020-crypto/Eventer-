# Eventer - Local Events Discovery App

A Flutter cross-platform mobile app that helps users discover local events across the USA, including yard sales, car shows, pop-ups, and other community events.

## Features

- 🎯 **Browse Events** - Discover events in your area
- 🏷️ **Event Categories** - Filter by yard sales, car shows, pop-ups, and local events
- ❤️ **Favorites** - Save your favorite events
- 🗺️ **Location-based Search** - Find events near you
- 📱 **Cross-platform** - Works on iOS and Android
- 🔍 **Search** - Find events by name or location

## Project Structure

```
lib/
├── main.dart              # App entry point
├── models/
│   └── event_model.dart   # Event data model
├── providers/
│   └── event_provider.dart # State management
├── screens/
│   ├── home_screen.dart   # Main events listing
│   └── event_detail_screen.dart  # Event details
└── widgets/
    └── event_card.dart    # Reusable event card component
```

## Getting Started

### Prerequisites

- Flutter SDK (3.0+)
- Dart SDK
- Android Studio / Xcode (for emulators)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/larryflores2020-crypto/Eventer-.git
cd Eventer-
```

2. Get dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Tech Stack

- **Framework**: Flutter
- **State Management**: Provider
- **Location Services**: Geolocator
- **Maps**: Google Maps Flutter
- **HTTP**: http package
- **Local Storage**: SharedPreferences

## Planned Features

- [ ] User authentication
- [ ] Event creation/posting
- [ ] Google Maps integration
- [ ] Push notifications
- [ ] Event filtering by distance
- [ ] User profiles
- [ ] Event ratings and reviews
- [ ] Backend API integration

## Development Notes

- Currently using mock data for demonstration
- Replace mock data in `EventProvider.loadMockEvents()` with real API calls
- Configure Google Maps API keys for map features
- Set up authentication system

## Contributing

Feel free to fork, create branches, and submit pull requests!

## License

MIT License - See LICENSE file for details

## Author

Larry Flores