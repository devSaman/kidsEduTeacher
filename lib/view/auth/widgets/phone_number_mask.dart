import 'package:flutter/services.dart';

class CustomPhoneNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText =  StringBuffer();

    // Format the first two characters
    if (newTextLength >= 2) {
      newText.write('${newValue.text.substring(0, usedSubstringIndex = 2)}-');
      if (newValue.selection.end >= 2) selectionIndex++;
    }

    // Format the next three characters
    if (newTextLength >= 5) {
      newText.write('${newValue.text.substring(2, usedSubstringIndex = 5)}-');
      if (newValue.selection.end >= 5) selectionIndex++;
    }

    // Format the next two characters
    if (newTextLength >= 7) {
      newText.write('${newValue.text.substring(5, usedSubstringIndex = 7)}-');
      if (newValue.selection.end >= 7) selectionIndex++;
    }

    // Format the last two characters
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(7, usedSubstringIndex = 11));
      if (newValue.selection.end >= 11) selectionIndex++;
    }

    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
