import 'package:flutter/material.dart';

Card DosyaBilgileri(BuildContext context) {
  return Card(
      child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Eksper/Servis Bilgileri",
              style: Theme.of(context).textTheme.headline6,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red, // Çerçeve rengi
                    width: 2.0, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                "Kapatıldı",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
        Container(
            width: double.infinity,
            child: Text(
              "Dosya No: 515315135",
              style: TextStyle(
                  color: Colors.blue[600], fontWeight: FontWeight.w600),
            )),
        Row(
          children: [
            Container(
              height: 20,
              width: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    'assets/fullstar.jpeg',
                    height: 20,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    ),
  ));
}
