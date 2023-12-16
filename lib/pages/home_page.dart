import 'package:flutter/material.dart';
import 'package:sigortamcepte/constants/textstyle_consts.dart';
import 'package:sigortamcepte/core/offer_card.dart';
import 'package:sigortamcepte/core/policy_card.dart';
import 'package:sigortamcepte/pages/accident_datail_page.dart';
import 'package:sigortamcepte/product/custom_appbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(actions: [
        IconButton(
            onPressed: () {}, icon: Icon(Icons.notifications_none_rounded)),
        CircleAvatar(
          child: Image.asset(
            'assets/crushedcar.jpeg',
          ),
        )
      ]),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // POLICY CARD
                PolicyCardListview(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SANA OZEL",
                        style: kBlackBoldTextStyle,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AccidentDetailPage();
                            }));
                          },
                          child: Text("Kaza Yaptım")),
                    ],
                  ),
                ),
                OfferCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PolicyCardListview extends StatelessWidget {
  const PolicyCardListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return PolicyCard(index: index);
        },
      ),
    );
  }
}
