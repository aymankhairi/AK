import 'package:alaraaf/core/constant/color.dart';
import 'package:flutter/material.dart';

class TextBodyAuth extends StatelessWidget {
  final String text;

  const TextBodyAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }
}
