import 'package:flutter/material.dart';
import 'package:sigortamcepte/constants/color_const.dart';

class WidgetContainer extends StatefulWidget {
  final Color backgroundColor;
  final int index;
  final String text;
  final String image;
  final void Function()? onTap;

  WidgetContainer({
    this.backgroundColor = Colors.white,
    required this.index,
    required this.text,
    required this.image,
    this.onTap,
  });

  @override
  State<WidgetContainer> createState() => _WidgetContainerState();
}

class _WidgetContainerState extends State<WidgetContainer> {
  @override
  Widget build(BuildContext context) {
    Color shadowColor = getColor(widget.index);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.backgroundColor,
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              color: shadowColor,
              offset: Offset(0, 3),
              blurStyle: BlurStyle.solid,
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              child: Center(
                child: Image.asset(
                  widget.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
