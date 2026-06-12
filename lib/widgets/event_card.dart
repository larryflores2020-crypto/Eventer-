import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eventer/models/event_model.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const EventCard({
    Key? key,
    required this.event,
    required this.onTap,
    required this.onFavoriteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('MMM d, yyyy h:mm a');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.grey[300],
              ),
              child: event.imageUrl != null
                  ? Image.network(
                      event.imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Icon(
                        Icons.event,
                        size: 80,
                        color: Colors.grey[600],
                      ),
                    ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Favorite Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          event.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          event.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: onFavoriteTap,
                        constraints: const BoxConstraints(),
                        padding: const EdgeInsets.all(4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Event Type Badge
                  Chip(
                    label: Text(
                      _getEventTypeLabel(event.eventType),
                      style: const TextStyle(fontSize: 12),
                    ),
                    backgroundColor: _getEventTypeColor(event.eventType),
                    labelStyle: const TextStyle(color: Colors.white),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  const SizedBox(height: 8),
                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          event.location,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Date/Time
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          dateFormatter.format(event.startDate),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Attendees
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${event.attendees} attending',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getEventTypeLabel(String eventType) {
    switch (eventType) {
      case 'yard_sale':
        return 'Yard Sale';
      case 'car_show':
        return 'Car Show';
      case 'pop_up':
        return 'Pop-up';
      case 'local_event':
        return 'Local Event';
      default:
        return 'Event';
    }
  }

  Color _getEventTypeColor(String eventType) {
    switch (eventType) {
      case 'yard_sale':
        return Colors.orange;
      case 'car_show':
        return Colors.red;
      case 'pop_up':
        return Colors.purple;
      case 'local_event':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }
}