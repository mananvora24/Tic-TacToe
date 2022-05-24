import 'package:flutter/material.dart';

import 'ui/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cut My Carbon',
      theme: ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 49, 48, 48),
      primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

