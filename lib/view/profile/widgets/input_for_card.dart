import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class InputForCard extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? inputType;
  final int? maxLength;
  const InputForCard(
      {super.key,
      required this.controller,
      this.hintText,
      this.inputFormatter,
      this.inputType,
      this.maxLength});

  @override
  State<InputForCard> createState() => _InputForCardState();
}

class _InputForCardState extends State<InputForCard> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      keyboardType: widget.inputType,
      inputFormatters: widget.inputFormatter,
      style: TextStyles.s600r18Black,
      cursorColor: Pallate.mainColor,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Pallate.mainColor.withOpacity(.4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Pallate.mainColor),
        ),
      ),
    );
  }
}
