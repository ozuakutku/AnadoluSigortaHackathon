import 'package:flutter/material.dart';
import 'package:sigortamcepte/pages/harita.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    required List<Widget> this.actions,
  });
  List<Widget> actions;

  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.notes_rounded)),
        title: Column(
          children: [
            Text(
              "ANADOLU",
              style: TextStyle(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Text(
              "SİGORTA",
              style: TextStyle(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ],
        ),
        actions: actions);
  }
}
