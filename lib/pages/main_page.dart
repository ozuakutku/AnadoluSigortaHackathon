import 'package:flutter/material.dart';
import 'harita.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "ANADOLU",
              style: TextStyle(
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              "SİGORTA",
              style: TextStyle(
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
        actions: [
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
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
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
              title: Text('Ana Sayfa'),
              onTap: () {
                // Ana sayfa ile ilgili işlemleri ekleyin
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('En Yakın'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Harita()),
                );
              },
            ),
            ListTile(
              title: Text('S.S.S.'),
              onTap: () {
                // En Yakın S.S.S. ile ilgili işlemleri ekleyin
                // ...
                Navigator.pop(context);
              },
              // Diğer menü seçenekleri ekleyin
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: 0,
            left: isMenuOpen ? MediaQuery.of(context).size.width * 0.6 : 0,
            right: isMenuOpen ? -MediaQuery.of(context).size.width * 0.6 : 0,
            bottom: 0,
            child: Scaffold(
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
                            margin: EdgeInsets.only(right: 8),
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
                                  onTap: () {},
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
          ),
          isMenuOpen
              ? Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.black54,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMenuOpen = false;
                        });
                      },
                      child: Container(),
                    ),
                  ),
                )
              : Container(),
          isMenuOpen ? MainMenu() : Container(),
        ],
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
    return Container(
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
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            title: Text('Ana Sayfa'),
            onTap: () {
              // Ana sayfa ile ilgili işlemleri ekleyin
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('En Yakın'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Harita()),
              );
            },
          ),
          ListTile(
            title: Text('S.S.S.'),
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
