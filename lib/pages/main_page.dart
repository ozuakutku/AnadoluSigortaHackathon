import 'package:flutter/material.dart';
import 'package:sigortamcepte/pages/home_page.dart';
import 'package:sigortamcepte/product/custom_appbar.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Giriş Yap Tıklanabilir Yazısı ile ilgili işlemleri ekleyin
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0,
              ),
              child: Text(
                'Giriş Yap',
                style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kampanyalar ve Duyurular
              Container(
                padding: EdgeInsets.all(16),
                child: Text('Kampanyalar ve Duyurular'),
              ),
              // Storyler
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          right: 8), // Storyler arasındaki boşluk
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
                          // Metin Storyler Altında
                          Text(
                            getStoryTitle(index),
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Ürün ve Tekliflerimiz
              Container(
                padding: EdgeInsets.all(16),
                child: Text('Ürün ve Tekliflerimiz'),
              ),
              SizedBox(
                height: 30,
              ),
              // Alt Kısımdaki 6 Widget
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 400,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: WidgetContainer(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomePage();
                              }), (route) => false);
                            },
                            backgroundColor: Colors.white,
                            shadowColor: Colors.orangeAccent,
                            text: 'ARAÇ',
                            image: 'assets/witgetlar/arac.png',
                          ),
                        ),
                        Expanded(
                          child: WidgetContainer(
                            onTap: () {},
                            backgroundColor: Colors.white,
                            shadowColor: Colors.redAccent,
                            text: 'KONUT',
                            image: 'assets/witgetlar/konut.png',
                          ),
                        ),
                        Expanded(
                          child: WidgetContainer(
                            onTap: () {},
                            backgroundColor: Colors.white,
                            shadowColor: Colors.green,
                            text: 'SAĞLIK',
                            image: 'assets/witgetlar/saglik.png',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: WidgetContainer(
                            onTap: () {},
                            backgroundColor: Colors.white,
                            shadowColor: Colors.purple,
                            text: 'PATİM GÜVENDE',
                            image: 'assets/witgetlar/patimguvende.png',
                          ),
                        ),
                        Expanded(
                          child: WidgetContainer(
                            onTap: () {},
                            backgroundColor: Colors.white,
                            shadowColor: Color(0xff223318),
                            text: 'SEYAHAT',
                            image: 'assets/witgetlar/seyahat.png',
                          ),
                        ),
                        Expanded(
                          child: WidgetContainer(
                            onTap: () {},
                            backgroundColor: Colors.white,
                            shadowColor: Color(0xff8473EC),
                            text: 'DİĞER',
                            image: 'assets/witgetlar/diger.png',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
    // Resim dosyalarınızın adlarını burada kullanmalısınız
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
}

class WidgetContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color shadowColor;
  final String text;
  final String image;
  final Function()? onTap;

  WidgetContainer({
    required this.backgroundColor,
    required this.shadowColor,
    required this.text,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
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
                  image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
