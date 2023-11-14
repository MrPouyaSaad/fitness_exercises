// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fitness_exercises/models/card.dart';
import 'package:get/get.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  const ExerciseDetailsScreen({
    Key? key,
    required this.exerciseList,
    required this.title,
  }) : super(key: key);
  final List<CardItem> exerciseList;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: exerciseList.length,
        itemBuilder: (context, index) {
          final String image =
              'assets/images/${exerciseList[index].imagePatch}.png';
          final String title = exerciseList[index].title;
          return Container(
            height: 300,
            width: double.infinity,
            margin: EdgeInsets.only(
                top: 48, bottom: index == exerciseList.length - 1 ? 48 : 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              color: Colors.black45,
            ),
            child: Column(
              children: [
                Spacer(),
                Text(
                  title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ).marginSymmetric(horizontal: 16),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                  ),
                  child: Image.asset(image),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
