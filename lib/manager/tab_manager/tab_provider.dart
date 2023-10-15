import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get index => _currentIndex;

  set index(int value) {
    _currentIndex = value;

    notifyListeners();
  }
}
