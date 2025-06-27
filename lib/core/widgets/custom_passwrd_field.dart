import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.hintText, this.controller});
  final String? hintText;
  final TextEditingController? controller;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is Required';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            isPasswordVisible = !isPasswordVisible;
            setState(() {});
          },
          icon: isPasswordVisible
              ? Icon(Icons.visibility, color: Colors.grey.withAlpha(128))
              : Icon(Icons.visibility_off, color: Colors.grey.withAlpha(128)),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        border: _buildBorder(),
        focusedBorder: _buildBorder(),
        enabledBorder: _buildBorder(),
      ),
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      obscureText: isPasswordVisible,
    );
  }

  OutlineInputBorder _buildBorder([Color? color]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: color ?? Colors.grey, width: 1),
  );
}
