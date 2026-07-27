import 'package:first_app_flutter/data/notifiers.dart';
import 'package:first_app_flutter/views/pages/welcome_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
              seedColor: Colors.green,
            ),
          ),
          home: WelcomePage(),
        );
      },
    );
  }
}
