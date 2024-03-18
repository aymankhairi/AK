import 'package:alaraaf/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventCard extends StatelessWidget {
  final bool ispast;
  final text;
  const EventCard({super.key, required this.ispast, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: SizedBox(
              width: Get.width / 4,
              child: Container(
                margin: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                    color:
                        ispast ? AppColor.thirdcolor : Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(8)),
                child: Center(child: text),
              ),
            ),
          )
        ],
      ),
    );
  }
}
