// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:fitness_exercises/providers/category_provider.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController videoPlayerController =
      VideoPlayerController.asset(
    'assets/videos/press_barble.mp4',
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
            return Container(
              height: 186,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 32, left: 24, right: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.black54,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.title,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        if (category.caption != null)
                          Text(
                            category.caption,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
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
                    Expanded(
                      child: VideoPlayer(videoPlayerController),
                    )
                ],
              ).paddingSymmetric(
                horizontal: 16,
              ),
            );
          }
        },
      ),
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
