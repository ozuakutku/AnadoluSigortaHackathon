import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String fileStatus;
  final String fileNo;
  final String phoneNumber;
  final String email;
  final String address;

  const InfoCard({
    Key? key,
    required this.title,
    required this.fileStatus,
    required this.fileNo,
    required this.phoneNumber,
    required this.email,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),

            //Details
            child: InfoCardDetails(context),
          ),
          //Stripe
          BlueBottomStripe()
        ],
      ),
    );
  }

  Container BlueBottomStripe() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
      height: 10,
    );
  }

  Column InfoCardDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Eksper :",
          style: Theme.of(context).textTheme.headline6,
        ),
        Text('Servis Telefon: $phoneNumber'),
        Text('Servis E-Posta: $email'),
        Text('Servis Adres: $address'),
        const SizedBox(height: 8),
        Text(
          "Anlaşmalı Servis :",
          style: Theme.of(context).textTheme.headline6,
        ),
        Text('Servis Telefon: $phoneNumber'),
        Text('Servis E-Posta: $email'),
        Text('Servis Adres: $address'),
      ],
    );
  }
}
