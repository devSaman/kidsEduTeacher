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
  final bool hasborder;
  final Function(String)? onChanged;
  const InputForCard(
      {super.key,
      required this.controller,
      this.onChanged,
      this.hintText,
      required this.hasborder,
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
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      keyboardType: widget.inputType,
      inputFormatters: widget.inputFormatter,
      style: TextStyles.s600r18Black,
      cursorColor: Pallate.mainColor,
      controller: widget.controller,
      decoration: InputDecoration(
          border: widget.hasborder ? null : InputBorder.none,
          hintText: widget.hintText,
          enabledBorder: widget.hasborder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(color: Pallate.mainColor.withOpacity(.4)),
                )
              : null,
          focusedBorder: widget.hasborder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Pallate.mainColor),
                )
              : null),
    );
  }
}
