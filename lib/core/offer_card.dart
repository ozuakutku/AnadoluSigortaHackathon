import 'package:flutter/material.dart';
import 'package:sigortamcepte/constants/color_const.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              elevation: 10,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    OfferCardTitle(),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Text(
                            "ÇİLİNGİR VE ASİSTAN HAKKINIZ BULUNMAKTA!",
                            maxLines: 3,
                          ),
                        ),
                        Image.asset(
                          "assets/crushedcar.jpeg",
                          fit: BoxFit.fill,
                          width: 100,
                          height: 200,
                        )
                      ],
                    ),
                    CustomChipWidget(),
                  ],
                ),
              ));
        },
      ),
    );
  }
}

class CustomChipWidget extends StatelessWidget {
  const CustomChipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 50,
      child: Row(
        children: List.generate(
          3,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    color: kLightGrey, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                  child: Text(
                    'Asistan',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class OfferCardTitle extends StatelessWidget {
  const OfferCardTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kLightGrey,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 40, top: 7, bottom: 7),
        child: Text(
          "Konut Poliçesi",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
    );
  }
}
