import 'package:flutter/material.dart';
import 'package:sigortamcepte/constants/textstyle_consts.dart';

class AfterSaveFilePage extends StatefulWidget {
  final String sigtortaSirketiAdi;
  final String policeNo;
  final String isim;
  final String tc;
  final String sehir;
  final String ilce;
  final DateTime tarih = DateTime.now();
  final String kazaYapanIsim;
  final String kazaYapanYakinlik;
  final String konum;
  final String plaka;
  final String aciklama;
  final String hasarTuru;
  AfterSaveFilePage(
      {required this.sigtortaSirketiAdi,
      required this.policeNo,
      required this.isim,
      required this.tc,
      required this.sehir,
      required this.ilce,
      required this.kazaYapanIsim,
      required this.kazaYapanYakinlik,
      required this.konum,
      required this.aciklama,
      required this.plaka,
      required this.hasarTuru});

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
              height: MediaQuery.of(context).size.height / 1.5,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.sigtortaSirketiAdi),
                    SizedBox(height: 16.0),
                    Text(widget.policeNo),
                    SizedBox(height: 16.0),
                    Text(widget.isim),
                    SizedBox(height: 16.0),
                    Text(widget.tc),
                    SizedBox(height: 16.0),
                    Text(widget.sehir),
                    SizedBox(height: 16.0),
                    Text(widget.ilce),
                    SizedBox(height: 16.0),
                    Text(widget.kazaYapanIsim),
                    SizedBox(height: 16.0),
                    Text(widget.kazaYapanYakinlik),
                    SizedBox(height: 16.0),
                    Text(widget.hasarTuru),
                    SizedBox(height: 16.0),
                    Text(widget.tarih.toString()),
                    SizedBox(height: 16.0),
                    Text(widget.aciklama),
                    SizedBox(height: 16.0),
                    Text(
                      widget.aciklama,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
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
