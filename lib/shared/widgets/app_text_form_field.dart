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
    this.labelText,
    this.initialValue,
    this.readOnly = false,
    this.autofocus = false,
    this.onTap,
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
  final String? labelText;
  final String? initialValue;
  final bool readOnly;
  final bool autofocus;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      initialValue: initialValue,
      obscureText: obscureText,
      style: const TextStyle(fontSize: 13),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIconConstraints: const BoxConstraints(maxHeight: 25),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 13),
        filled: true,
        fillColor: Colors.white,
      ),
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      autofocus: autofocus,
      onTap: onTap,
    );
  }
}
