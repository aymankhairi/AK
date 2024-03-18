import 'package:alaraaf/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpirtualPrice extends StatelessWidget {
  final String price;

  const SpirtualPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(
        height: 50,
      ),
      Text("${"price".tr}  :  ",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.thirdcolor)),
      Text(price,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.thirdcolor)),
      Icon(
        size: 25,
        Icons.monetization_on,
        color: Colors.yellow[800],
      ),
    ]);
  }
}
