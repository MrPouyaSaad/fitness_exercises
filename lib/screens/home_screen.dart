// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_exercises/constant/exercise_list.dart';
import 'package:fitness_exercises/screens/exercise/exercise_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'package:fitness_exercises/providers/category_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: ListView.builder(
        itemCount: categoryProvider.cardItem.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Row(
              children: [
                Text(
                  'Exercise\nProgram',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 36,
                  ),
                ),
              ],
            ).marginSymmetric(horizontal: 24, vertical: 16);
          } else if (index == 1) {
            return CategoryList();
          } else {
            final basePach = 'assets/images/';
            final category = categoryProvider.cardItem[index - 2];
            bool isExerciseList = categoryProvider.index == 2;
            return Container(
              height: isExerciseList ? 96 : 186,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 32, left: 24, right: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.black54,
              ),
              child: InkWell(
                onTap: () {
                  switch (index) {
                    case 2:
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ExerciseDetailsScreen(
                                  exerciseList: armList,
                                  title: 'Chest',
                                )),
                      );
                    case 3:
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ExerciseDetailsScreen(
                                  exerciseList: armList,
                                  title: 'Arm',
                                )),
                      );
                    case 4:
                    case 5:
                    case 6:
                      break;
                    default:
                  }
                },
                borderRadius: BorderRadius.circular(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            category.title,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          if (!isExerciseList) Spacer(),
                          if (category.caption != null)
                            Text(
                              category.caption,
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          if (!isExerciseList)
                            SizedBox(
                              height: 16,
                            ),
                        ],
                      ).paddingSymmetric(vertical: 12),
                    ),
                    if (category.caption != null)
                      Image.asset(
                        basePach + category.imagePatch,
                      )
                    else
                      // ExerciseVideo(
                      //   videoPatch: category.imagePatch,
                      // ),
                      Text(category.title),
                  ],
                ).paddingSymmetric(
                  horizontal: 16,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class ExerciseVideo extends StatefulWidget {
  const ExerciseVideo({
    Key? key,
    required this.videoPatch,
  }) : super(key: key);

  final String videoPatch;
  @override
  State<ExerciseVideo> createState() => _ExerciseVideoState();
}

class _ExerciseVideoState extends State<ExerciseVideo> {
  final String basePatch = 'assets/videos/';
  late VideoPlayerController videoPlayerController =
      VideoPlayerController.asset(
    basePatch + widget.videoPatch,
    videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: false),
  )
        ..initialize()
        ..setLooping(true)
        ..play();

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: VideoPlayer(videoPlayerController),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 64,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        itemCount: categoryProvider.categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              categoryProvider.changeCategory(index);
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: 24,
                  right:
                      index == categoryProvider.categories.length - 1 ? 24 : 0),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: index == categoryProvider.index
                    ? Colors.white.withOpacity(0.4)
                    : Colors.white.withOpacity(0.075),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                categoryProvider.categories[index],
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
