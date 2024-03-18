import 'package:alaraaf/core/constant/color.dart';
import 'package:flutter/material.dart';

class TextTitileAuth extends StatelessWidget {
  final String text;
  const TextTitileAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: AppColor.black,
          fontFamily: "PlayfairDisplay"),
    );
  }
}
