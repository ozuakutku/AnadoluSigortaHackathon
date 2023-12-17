import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigortamcepte/constants/main_page_bottom_container.dart';
import 'package:sigortamcepte/constants/main_stories_listview.dart';
import 'package:sigortamcepte/product/custom_appbar.dart';
import 'package:sigortamcepte/product/custom_drawer.dart';
import 'package:sigortamcepte/service/datas.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    late Datas datas = Provider.of<Datas>(context);

    datas.getDatas();
    return datas.isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: CustomAppBar(
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_none_rounded)),
                CircleAvatar(
                  child: Image.asset(
                    'assets/crushedcar.jpeg',
                  ),
                )
              ],
            ),
            drawer: CustomDrawer(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kampanyalar ve Duyurular
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const Text('Kampanyalar ve Duyurular'),
                  ),
                  // Yuvarlak Butonlar
                  mainStories(),
                  // Ürün ve Tekliflerimiz
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const Text('Ürün ve Tekliflerimiz'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Alt Kısımdaki 6 Widget
                  const MainCards(),
                ],
              ),
            ),
          );
  }
}
