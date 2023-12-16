import 'package:flutter/material.dart';

Color kLightGrey = Color.fromARGB(255, 229, 229, 229);

List<Color> kRandomColor = [
  Colors.orangeAccent,
  Colors.redAccent,
  Colors.green,
  Colors.purple,
  Color(0xff223318),
  Color(0xff8473EC),
  Color.fromARGB(255, 157, 252, 103),
  Color.fromARGB(255, 64, 38, 236),
  Color.fromARGB(255, 60, 165, 179),
  Color.fromARGB(255, 247, 123, 85),
  Color.fromARGB(255, 97, 65, 240),
  Color.fromARGB(255, 143, 131, 250),
];
Color getColor(int index) {
  int mod = index % 11;
  return kRandomColor[mod];
}
