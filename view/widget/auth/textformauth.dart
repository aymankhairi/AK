import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconText;
  final IconData? iconText2;
  final TextEditingController? myController;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obsecuretext;
  final void Function()? onTapIcon;
  final TextInputType? textInputType;
  const TextFormAuth({
    super.key,
    this.onTapIcon,
    this.obsecuretext,
    required this.hintText,
    required this.labelText,
    required this.iconText,
    required this.myController,
    required this.valid,
    required this.isNumber,
    this.iconText2,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: myController,
        obscureText:
            obsecuretext == null || obsecuretext == false ? false : true,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 12,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(labelText)),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(iconText),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
