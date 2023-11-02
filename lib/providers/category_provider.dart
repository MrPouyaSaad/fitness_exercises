import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  int index = 0;
  List categories = ['For you', 'Challenges', 'Exercises', 'Supplement'];

  void changeCategory(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
