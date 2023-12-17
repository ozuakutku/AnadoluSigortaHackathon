import 'package:flutter/material.dart';

class Datas with ChangeNotifier {
  String? name;
  nameSetter(String name) {
    this.name = name;
    notifyListeners();
  }

  String? get nameGetter => name;
}
