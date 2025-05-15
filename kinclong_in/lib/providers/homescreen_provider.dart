import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  String _userName = "Dian";

  String get userName => _userName;

  void updateUserName(String name) {
    _userName = name;
    notifyListeners();
  }
}
