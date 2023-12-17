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
  void showPopupCekici(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Çekicinin geleceğini onayladınız'),
          content: Text(
              'Çekici en kısa zamanda yola çıkacak'), // İstediğiniz metni burada ayarlayabilirsiniz
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }

  void showPopupKendim(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kendinizin ulaşım sağlayacağınızı onayladınız'),
          content: Text(
              'Bayilerimizde görüşmek üzere'), // İstediğiniz metni burada ayarlayabilirsiniz
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 226, 226, 226),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    color: Colors.blue,
                    offset: Offset(0, 3),
                    blurStyle: BlurStyle.solid,
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      context, "SİGORTA ŞİRKETİ:  ", widget.sigtortaSirketiAdi),
                  SizedBox(height: 16.0),
                  CustomText(context, "POLİCE NUMARASI:  ", widget.policeNo),
                  SizedBox(height: 16.0),
                  CustomText(context, "İİSİM SOYİSİM:  ", widget.isim),
                  SizedBox(height: 16.0),
                  CustomText(context, "TC:  ", widget.tc),
                  SizedBox(height: 16.0),
                  CustomText(context, "İL:  ", widget.sehir),
                  SizedBox(height: 16.0),
                  CustomText(context, "İLCE:  ", widget.ilce),
                  SizedBox(height: 16.0),
                  CustomText(context, "KAZA YAPAN KİŞİNİN ADI:  ",
                      widget.kazaYapanIsim),
                  SizedBox(height: 16.0),
                  CustomText(context, "KAZA YAPAN KİŞİNİN YAKINLIĞI:  ",
                      widget.kazaYapanYakinlik),
                  SizedBox(height: 16.0),
                  CustomText(context, "HASAR TÜRÜ:  ", widget.hasarTuru),
                  SizedBox(height: 16.0),
                  CustomText(
                      context, "KAZA TARİHİ:  ", formatDate(widget.tarih)),
                  SizedBox(height: 16.0),
                  CustomText(context, "KAZA AÇIKLMASI:  ", widget.aciklama),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showPopupCekici(context);
                    },
                    child: Text("Çekici Çağır")),
                ElevatedButton(
                    onPressed: () {
                      showPopupKendim(context);
                    },
                    child: Text("Tamirciye Ben gideceğim"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget CustomText(BuildContext context, String title, String text) {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        TextSpan(
          text: text,
          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
        ),
      ],
    ),
  );
}

String formatDate(DateTime dateTime) {
  String day = dateTime.day.toString().padLeft(2, '0');
  String month = dateTime.month.toString().padLeft(2, '0');
  String year = dateTime.year.toString();

  return '$day-$month-$year';
}
