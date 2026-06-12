import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eventer/providers/event_provider.dart';
import 'package:eventer/widgets/event_card.dart';
import 'package:eventer/screens/event_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'all';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    // Load mock events on initialization
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EventProvider>().loadMockEvents();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventer'),
        elevation: 0,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All Events'),
            Tab(text: 'Yard Sales'),
            Tab(text: 'Car Shows'),
            Tab(text: 'Pop-ups'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search events...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          // Events List
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildEventsList(context, 'all'),
                _buildEventsList(context, 'yard_sale'),
                _buildEventsList(context, 'car_show'),
                _buildEventsList(context, 'pop_up'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to create event screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Create event feature coming soon!')),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
      ),
    );
  }

  Widget _buildEventsList(BuildContext context, String eventType) {
    return Consumer<EventProvider>(
      builder: (context, eventProvider, child) {
        if (eventProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<dynamic> events = eventType == 'all'
            ? eventProvider.events
            : eventProvider.filterByEventType(eventType);

        // Apply search filter
        if (_searchController.text.isNotEmpty) {
          events = eventProvider.searchEvents(_searchController.text);
        }

        if (events.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.event_note, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No events found',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return EventCard(
              event: event,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetailScreen(event: event),
                  ),
                );
              },
              onFavoriteTap: () {
                context.read<EventProvider>().toggleFavorite(event.id);
              },
            );
          },
        );
      },
    );
  }
}