import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.notes_rounded)),
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
      actions: [
        IconButton(
            onPressed: () {}, icon: Icon(Icons.notifications_none_rounded)),
        CircleAvatar(
          child: Image.asset(
            'assets/crushedcar.jpeg',
          ),
        )
      ],
    );
  }
}
