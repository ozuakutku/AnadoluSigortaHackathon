import 'package:flutter/material.dart';
import 'package:sigortamcepte/constants/textstyle_consts.dart';

class AfterSaveFilePage extends StatefulWidget {
  final String dosyaNo;
  final String ad;
  final String soyad;
  final String PlakaNo;
  final String dosyaTarihi;
  final String hasarTuru;
  final String konum;
  final String aciklama;

  AfterSaveFilePage({
    required this.dosyaNo,
    required this.ad,
    required this.soyad,
    required this.PlakaNo,
    required this.dosyaTarihi,
    required this.hasarTuru,
    required this.konum,
    required this.aciklama,
  });

  @override
  State<AfterSaveFilePage> createState() => _AfterSaveFilePageState();
}

class _AfterSaveFilePageState extends State<AfterSaveFilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DOSYA BİLGİLERİ',
          style: kBlackBoldTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Dosya Numarası:'),
                        SizedBox(height: 16.0),
                        Text('Dosya Sahibi:'),
                        SizedBox(height: 16.0),
                        Text('Plaka Numarası:'),
                        SizedBox(height: 16.0),
                        Text('Dosya oluşturulma tarihi:'),
                        SizedBox(height: 16.0),
                        Text('Hasar Türü:'),
                        SizedBox(height: 16.0),
                        Text('Hasar Açıklaması:'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.dosyaNo),
                        SizedBox(height: 16.0),
                        Text(widget.ad),
                        SizedBox(height: 16.0),
                        Text(widget.PlakaNo),
                        SizedBox(height: 16.0),
                        Text(widget.dosyaTarihi),
                        SizedBox(height: 16.0),
                        Text(widget.hasarTuru),
                        SizedBox(height: 16.0),
                        Text(
                          widget.aciklama,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Çekici Çağır")),
                ElevatedButton(
                    onPressed: () {}, child: Text("Tamirciye Ben gideceğim"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
