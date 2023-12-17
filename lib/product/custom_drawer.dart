import 'package:flutter/material.dart';
import 'package:sigortamcepte/pages/harita.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menü',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Ana Sayfa'),
            onTap: () {
              // Ana sayfa ile ilgili işlemleri ekleyin
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('En Yakın'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapPage()),
              );
            },
          ),
          ListTile(
            title: const Text('S.S.S.'),
            onTap: () {
              // En Yakın S.S.S. ile ilgili işlemleri ekleyin
              // ...
              Navigator.pop(context);
            },
            // Diğer menü seçenekleri ekleyin
          ),
        ],
      ),
    );
  }
}
