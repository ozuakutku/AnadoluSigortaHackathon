import 'package:flutter/material.dart';
import 'package:sigortamcepte/models/dosya_detaylari_servisi_model.dart';

Card FileSummary(BuildContext context, ClaimDetails? claimDetails) {
  var shortDescription =
      claimDetails!.claimDetails!.claimStatus!.shortDescription;
  Color descriptionColor =
      shortDescription == "AÇIK" ? Colors.green : Colors.red;
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
                    color: descriptionColor, // Çerçeve rengi
                    width: 2.0, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                shortDescription!,
                style: TextStyle(color: descriptionColor),
              ),
            ),
          ],
        ),
        Container(
            width: double.infinity,
            child: Text(
              "Dosya No: ${claimDetails.claimDetails!.claimNumber}",
              style: TextStyle(
                  color: Colors.blue[600], fontWeight: FontWeight.w600),
            )),
        Row(
          children: [
            Container(
              height: 20,
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < 4; i++)
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                  Icon(
                    Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  ));
}
