import 'package:flutter/material.dart';

Container mainStories() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    height: 150,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(right: 8),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    getStoryImage(index),
                  ),
                ),
              ),
              Text(
                getStoryTitle(index),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        );
      },
    ),
  );
}

String getStoryTitle(int index) {
  List<String> storyTitles = [
    'Cüzdan',
    'Trafik',
    'Sağlık',
    'Dask',
    'Pek Yakında',
    'Yeni Ürün',
  ];

  if (index < storyTitles.length) {
    return storyTitles[index];
  } else {
    return '';
  }
}

String getStoryImage(int index) {
  List<String> storyImages = [
    'assets/cuzdan.png',
    'assets/trafik.png',
    'assets/saglık.jpeg',
    'assets/dask.jpeg',
    'assets/cuzdan.png',
    'assets/cuzdan.png',
  ];

  if (index < storyImages.length) {
    return storyImages[index];
  } else {
    return '';
  }
}
