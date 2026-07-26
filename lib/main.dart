import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Materia App
//Scaffold
//App title
// Button navigation bar

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.green,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Flutter Mapp'))),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onDestinationSelected: (int value) {
            setState(() {
              selectedIndex = value;
            });
          },
          selectedIndex: selectedIndex,
        ),
      ),
    );
  }
}
