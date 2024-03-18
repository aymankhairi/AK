import 'package:alaraaf/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class logoLang extends StatelessWidget {
  const logoLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logo,
      height: 300,
      width: 300,
      fit: BoxFit.fill,
    );
  }
}
