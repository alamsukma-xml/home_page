import 'package:flutter/material.dart';
import 'package:quiz/pages/home_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ... lainnya
      home: const HomePage(), // Panggil HomePage
    );
  }
}