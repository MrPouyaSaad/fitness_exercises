import 'package:fitness_exercises/models/card.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  int index = 0;
  List categories = ['For you', 'Challenges', 'Exercises', 'Supplement'];

  List cardItem = forYouList;

  void changeCategory(int newIndex) {
    index = newIndex;
    switch (newIndex) {
      case 0:
        cardItem = forYouList;
      case 1:
        cardItem = challengesList;
      case 2:
        cardItem = exerciseTitleList;
      case 3:
        cardItem = supplementList;
    }
    notifyListeners();
  }
}

List<CardItem> forYouList = [
  CardItem(
    title: 'Cardio',
    imagePatch: 'cardio.png',
    caption: 'exercise for your cardiovascular system',
  ),
  CardItem(
    title: 'Cuting',
    imagePatch: 'cut.png',
    caption: 'lose fat without losing muscle',
  ),
  CardItem(
    title: 'Bulking',
    imagePatch: 'bulk.png',
    caption: 'the muscle gaining phase',
  ),
];
List<CardItem> challengesList = [
  CardItem(
      title: 'challengesList', imagePatch: 'imagePatch', caption: 'caption'),
  CardItem(title: 'title2', imagePatch: 'imagePatch2', caption: 'caption2'),
  CardItem(title: 'title3', imagePatch: 'imagePatch3', caption: 'caption3'),
];
List<CardItem> exercisesList = [
  CardItem(title: 'Barbell Bench Press', imagePatch: 'press_barble.mp4'),
  CardItem(title: 'Dumbbell Bench Press', imagePatch: 'press_barble.mp4'),
  CardItem(title: 'Incline Bench Press', imagePatch: 'press_barble.mp4'),
  CardItem(
      title: 'Incline Dumbbell Bench Press', imagePatch: 'press_barble.mp4'),
  CardItem(title: 'Dumbbell Flys', imagePatch: 'press_barble.mp4'),
  CardItem(title: 'Dumbbell Flys', imagePatch: 'press_barble.mp4'),
  CardItem(title: 'Chest Flye', imagePatch: 'press_barble.mp4'),
  CardItem(title: 'Push-Up', imagePatch: 'press_barble.mp4'),
  CardItem(title: 'Cable Iron Cross', imagePatch: 'press_barble.mp4'),
];
List<CardItem> supplementList = [
  CardItem(
      title: 'supplementList', imagePatch: 'imagePatch', caption: 'caption'),
  CardItem(title: 'title2', imagePatch: 'imagePatch2', caption: 'caption2'),
  CardItem(title: 'title3', imagePatch: 'imagePatch3', caption: 'caption3'),
  CardItem(title: 'title3', imagePatch: 'imagePatch3', caption: 'caption3'),
];

List<CardItem> exerciseTitleList = [
  CardItem(title: 'Chest', imagePatch: 'imagePatch2'),
  CardItem(title: 'Arm', imagePatch: 'imagePatch2'),
  CardItem(title: 'Axilla', imagePatch: 'imagePatch2'),
  CardItem(title: 'Shoulder', imagePatch: 'imagePatch2'),
  CardItem(title: 'Leg', imagePatch: 'imagePatch2'),
  CardItem(title: 'Cardio', imagePatch: 'imagePatch2'),
];
