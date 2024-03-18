import 'package:alaraaf/core/constant/color.dart';
import 'package:flutter/material.dart';

class TextSignUpAuth extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function() onTap;
  const TextSignUpAuth(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
