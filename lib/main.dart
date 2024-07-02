import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hubtel Coding Challenge",
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
