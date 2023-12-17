import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  bool border;
  EdgeInsetsGeometry? padding;
  String? hintText;
  String? labelText;
  int maxLines;
  Widget? prefix;
  Color borderColor;
  bool? enable;
  final TextEditingController controller;
  customTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.maxLines = 1,
    this.border = true,
    this.padding,
    this.prefix,
    this.enable,
    this.borderColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: 1.0),
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
            enabled: enable,
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              prefixIcon: prefix != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
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
