class Event {
  final String id;
  final String title;
  final String description;
  final String eventType; // yard_sale, car_show, pop_up, local_event
  final String location;
  final double latitude;
  final double longitude;
  final DateTime startDate;
  final DateTime endDate;
  final String? imageUrl;
  final String? contactPhone;
  final String? contactEmail;
  final int attendees;
  final bool isFavorite;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.eventType,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.startDate,
    required this.endDate,
    this.imageUrl,
    this.contactPhone,
    this.contactEmail,
    this.attendees = 0,
    this.isFavorite = false,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      eventType: json['eventType'],
      location: json['location'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      imageUrl: json['imageUrl'],
      contactPhone: json['contactPhone'],
      contactEmail: json['contactEmail'],
      attendees: json['attendees'] ?? 0,
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'eventType': eventType,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'imageUrl': imageUrl,
      'contactPhone': contactPhone,
      'contactEmail': contactEmail,
      'attendees': attendees,
      'isFavorite': isFavorite,
    };
  }

  Event copyWith({
    String? id,
    String? title,
    String? description,
    String? eventType,
    String? location,
    double? latitude,
    double? longitude,
    DateTime? startDate,
    DateTime? endDate,
    String? imageUrl,
    String? contactPhone,
    String? contactEmail,
    int? attendees,
    bool? isFavorite,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      eventType: eventType ?? this.eventType,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      imageUrl: imageUrl ?? this.imageUrl,
      contactPhone: contactPhone ?? this.contactPhone,
      contactEmail: contactEmail ?? this.contactEmail,
      attendees: attendees ?? this.attendees,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}