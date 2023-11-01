import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        itemCount: 5,
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
            );
          } else {
            return Container(
              height: 186,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.black54,
              ),
              child: Row(),
            );
          }
        },
      ),
    );
  }
}
