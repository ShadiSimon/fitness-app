


import 'package:assignment2_comp3130/Home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = const HomePage();
  }

  void switchState(Widget next) {
    setState(() {
      activeScreen = next;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: activeScreen),
    );
  }
}
