import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hintText, this.controller});
  final String? hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is Required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        border: _buildBorder(),
        focusedBorder: _buildBorder(Colors.blueAccent),
        enabledBorder: _buildBorder(),
      ),
    );
  }

  OutlineInputBorder _buildBorder([Color? color]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: color ?? Colors.grey, width: 1),
  );
}
