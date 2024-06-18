import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.obscureText = false,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.inputFormatters,
  });

  final bool obscureText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChanged;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: const TextStyle(fontSize: 13),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIconConstraints: const BoxConstraints(maxHeight: 25),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      focusNode: focusNode,
      inputFormatters: inputFormatters,
    );
  }
}
