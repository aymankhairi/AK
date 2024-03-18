import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormRequest extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconText;
  final IconData? iconText2;
  final TextEditingController? myController;
  final String? Function(String?) valid;
  final Pattern? filterPattern;
  final TextInputType? textInputType;
  final int? maxLines;
  final int? minLines;
  const TextFormRequest({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.iconText,
    required this.myController,
    required this.valid,
    this.iconText2,
    this.filterPattern,
    this.textInputType,
    required this.maxLines,
    required this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        maxLines: maxLines,
        minLines: minLines,
        inputFormatters: [FilteringTextInputFormatter.allow(filterPattern!)],
        keyboardType: TextInputType.text,
        validator: valid,
        controller: myController,
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
