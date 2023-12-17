import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool border;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final int maxLines;
  final Widget? prefix;
  final Color borderColor;
  final TextInputType? keyboardType;
  final bool? enable;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.maxLines = 1,
    this.border = true,
    this.padding,
    this.prefix,
    this.enable,
    this.keyboardType,
    this.borderColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: border == true
              ? Border.all(color: borderColor, width: 0.8)
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            keyboardType: keyboardType,
            enabled: enable,
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              prefixIcon: prefix != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 4.0),
                      child: prefix,
                    )
                  : null,
              labelText: labelText,
              border: InputBorder.none,
              hintText: hintText,
            ),
            textAlign: TextAlign.start,
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
            },
          ),
        ),
      ),
    );
  }
}
