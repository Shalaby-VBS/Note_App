import 'package:flutter/material.dart';

class CustomFormFiled extends StatelessWidget {
  const CustomFormFiled(
      {super.key,
      required this.hintText,
      this.maxLines = 1,
      this.onsaved,
      this.onchange,
      this.initialValue = ''});
  final String hintText;
  final int maxLines;
  final String initialValue;
  final void Function(String?)? onsaved;
  final void Function(String?)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onchange,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        }
        return null;
      },
      cursorColor: Colors.white,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.white));
}
