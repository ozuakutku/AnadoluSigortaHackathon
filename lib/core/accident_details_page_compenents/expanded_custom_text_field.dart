import 'package:flutter/material.dart';
import 'package:sigortamcepte/product/custom_text_field.dart';

class ExpandedCustomTextField extends StatelessWidget {
  const ExpandedCustomTextField({
    super.key,
    required this.controller,
    this.padding,
    this.prefix,
    this.enable,
    this.keyboardType,
  });
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final Widget? prefix;
  final bool? enable;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: customTextField(
        keyboardType: keyboardType,
        controller: controller,
        padding: padding,
        prefix: prefix,
        enable: enable,
      ),
    );
  }
}
