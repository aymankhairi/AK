import 'package:alaraaf/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active;
  const CustomButtonAppBar(
      {super.key,
      required this.onPressed,
      required this.textbutton,
      required this.icondata,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            color: active == true
                ? AppColor.primaryColor
                : const Color.fromARGB(91, 0, 0, 0),
            size: 28,
          ),
          Text(
            textbutton,
            style: TextStyle(
                color: active == true
                    ? AppColor.primaryColor
                    : const Color.fromARGB(129, 0, 0, 0),
                fontSize: 13),
          )
        ],
      ),
    );
  }
}
