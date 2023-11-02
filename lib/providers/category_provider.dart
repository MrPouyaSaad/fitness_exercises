import 'package:fitness_exercises/models/card.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  int index = 0;
  List categories = ['For you', 'Challenges', 'Exercises', 'Supplement'];
  List<CardItem> forYouList = [
    CardItem(title: 'forYouList', imagePatch: 'imagePatch', caption: 'caption'),
    CardItem(title: 'title2', imagePatch: 'imagePatch2', caption: 'caption2'),
  ];
  List<CardItem> challengesList = [
    CardItem(
        title: 'challengesList', imagePatch: 'imagePatch', caption: 'caption'),
    CardItem(title: 'title2', imagePatch: 'imagePatch2', caption: 'caption2'),
    CardItem(title: 'title3', imagePatch: 'imagePatch3', caption: 'caption3'),
  ];
  List<CardItem> exercisesList = [
    CardItem(
        title: 'exercisesList', imagePatch: 'imagePatch', caption: 'caption'),
    CardItem(title: 'title2', imagePatch: 'imagePatch2', caption: 'caption2'),
    CardItem(title: 'title2', imagePatch: 'imagePatch2', caption: 'caption2'),
    CardItem(title: 'title2', imagePatch: 'imagePatch2', caption: 'caption2'),
    CardItem(title: 'title2', imagePatch: 'imagePatch2', caption: 'caption2'),
    CardItem(title: 'title3', imagePatch: 'imagePatch3', caption: 'caption3'),
  ];
  List<CardItem> supplementList = [
    CardItem(
        title: 'supplementList', imagePatch: 'imagePatch', caption: 'caption'),
    CardItem(title: 'title2', imagePatch: 'imagePatch2', caption: 'caption2'),
    CardItem(title: 'title3', imagePatch: 'imagePatch3', caption: 'caption3'),
    CardItem(title: 'title3', imagePatch: 'imagePatch3', caption: 'caption3'),
  ];
  List cardItem = [
    CardItem(title: 'forYouList', imagePatch: 'imagePatch', caption: 'caption'),
    CardItem(title: 'title2', imagePatch: 'imagePatch2', caption: 'caption2'),
  ];

  void changeCategory(int newIndex) {
    index = newIndex;
    switch (newIndex) {
      case 0:
        cardItem = forYouList;
      case 1:
        cardItem = challengesList;
      case 2:
        cardItem = exercisesList;
      case 3:
        cardItem = supplementList;
    }
    notifyListeners();
  }
}
