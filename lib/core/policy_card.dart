import 'package:flutter/material.dart';
import 'package:sigortamcepte/constants/color_const.dart';
import 'package:sigortamcepte/constants/textstyle_consts.dart';

class PolicyCard extends StatelessWidget {
  final index;
  const PolicyCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Color _color = getColor(index);
    return Card(
      elevation: 10,
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                            "Motorlu Kara Taşıtları Birleşik Kasko Sigorta Poliçesi",
                            maxLines: 2,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'POLİÇE NO :',
                              style:
                                  kBoldOrangeTextStyle.copyWith(color: _color),
                            ),
                            TextSpan(
                                text: ' 515315351',
                                style: kBoldOrangeTextStyle.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: _color)),
                          ],
                        ),
                      ),
                      Text("1 Gün Kaldı"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black54),
                        children: [
                          TextSpan(
                            text: "Plaka: ",
                            style: kBlackBoldTextStyle,
                          ),
                          TextSpan(text: "03 AAA 03")
                        ]),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.error),
                          Text(
                            "Hasar dosyanız bulunmaktadir",
                            style: TextStyle(
                                color: Colors.blue[500],
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Detaylar",
                            style: kBoldOrangeTextStyle.copyWith(color: _color),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              decoration: BoxDecoration(
                  color: _color,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10))),
            )
          ],
        ),
      ),
    );
  }
}
