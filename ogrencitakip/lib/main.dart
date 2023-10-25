import 'package:flutter/material.dart';
import 'package:ogrencitakip/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> todo = ["İŞ", "Eğitim", "Oyun"];
List<String> completed = ["Game meetup", "Take out trash"];

class _MyAppState extends State<MyApp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
