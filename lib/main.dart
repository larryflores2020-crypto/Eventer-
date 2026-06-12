import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eventer/providers/event_provider.dart';
import 'package:eventer/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider()),
      ],
      child: MaterialApp(
        title: 'Eventer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}