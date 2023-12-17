import 'package:flutter/material.dart';
import 'package:sigortamcepte/core/widget_container.dart';
import 'package:sigortamcepte/pages/home_page.dart';

class MainCards extends StatelessWidget {
  const MainCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<dynamic, dynamic>> itemList = [
      {
        "onTap": () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        },
        'text': 'ARAÇ',
        'image': 'assets/witgetlar/arac.png',
      },
      {
        "onTap": () {},
        'text': 'KONUT',
        'image': 'assets/witgetlar/konut.png',
      },
      {
        "onTap": () {},
        'text': 'SAĞLIK',
        'image': 'assets/witgetlar/saglik.png',
      },
      {
        "onTap": () {},
        'text': 'PATİM GÜVENDE',
        'image': 'assets/witgetlar/patimguvende.png',
      },
      {
        "onTap": () {},
        'text': 'SEYAHAT',
        'image': 'assets/witgetlar/seyahat.png',
      },
      {
        "onTap": () {},
        'text': 'DİĞER',
        'image': 'assets/witgetlar/diger.png',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 500,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 18,
          crossAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return WidgetContainer(
            index: index,
            text: itemList[index]["text"],
            image: itemList[index]["image"],
            onTap: itemList[index]["onTap"],
          );
        },
      ),
    );
  }
}
