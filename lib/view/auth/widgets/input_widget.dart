import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isVisible;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? inputType;
  final int? maxLength;
  const InputWidget(
      {super.key,
      required this.controller,
      required this.label,
      this.suffixIcon,
      this.maxLength,
      this.hintText,
      this.inputFormatter,
      this.inputType,
      this.prefixIcon,
      this.isVisible});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      keyboardType: widget.inputType,
      inputFormatters: widget.inputFormatter,
      style: TextStyles.s700r20Black,
      cursorColor: Pallate.mainColor,
      controller: widget.controller,
      obscuringCharacter: "*",
      obscureText: widget.isVisible ?? false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        prefix: widget.prefixIcon,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Pallate.mainColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Pallate.mainColor),
        ),
        labelText: widget.label,
        labelStyle: TextStyles.s400r18Grey,
      ),
    );
  }
}
