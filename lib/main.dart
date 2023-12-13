import 'package:flutter/material.dart';
import 'package:sigortamcepte/pages/file_details_page.dart';
import 'package:sigortamcepte/pages/home_page.dart';
import 'package:sigortamcepte/pages//harita.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SigortamCep',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
