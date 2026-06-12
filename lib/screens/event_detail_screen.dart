import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eventer/models/event_model.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('MMM d, yyyy h:mm a');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image or Placeholder
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey[300],
              child: event.imageUrl != null
                  ? Image.network(
                      event.imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Icon(
                        Icons.event,
                        size: 100,
                        color: Colors.grey[600],
                      ),
                    ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Event Type Badge
                  Chip(
                    label: Text(_getEventTypeLabel(event.eventType)),
                    backgroundColor: _getEventTypeColor(event.eventType),
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue[600]),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          event.location,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Start Date/Time
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.blue[600]),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Start: ${dateFormatter.format(event.startDate)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // End Date/Time
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.blue[600]),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'End: ${dateFormatter.format(event.endDate)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Attendees
                  Row(
                    children: [
                      Icon(Icons.people, color: Colors.blue[600]),
                      const SizedBox(width: 8),
                      Text(
                        '${event.attendees} attendees',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  // Contact Information
                  const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (event.contactPhone != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.phone, color: Colors.blue[600]),
                          const SizedBox(width: 8),
                          Text(
                            event.contactPhone!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  if (event.contactEmail != null)
                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.blue[600]),
                        const SizedBox(width: 8),
                        Text(
                          event.contactEmail!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  const SizedBox(height: 24),
                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added to favorites!'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.favorite_outline),
                          label: const Text('Add to Favorites'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Directions opening soon!'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.directions),
                          label: const Text('Directions'),
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