import 'package:flutter/material.dart';
import 'package:te/pages/home_page.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes:  {
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
