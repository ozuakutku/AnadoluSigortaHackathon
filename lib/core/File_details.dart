import 'package:flutter/material.dart';
import 'package:sigortamcepte/models/dosya_detaylari_servisi_model.dart';

class FileDetails extends StatefulWidget {
  ClaimDetails? claimDetails;
  FileDetails({
    Key? key,
    required this.claimDetails,
  }) : super(key: key);

  @override
  State<FileDetails> createState() => _FileDetailsState();
}

class _FileDetailsState extends State<FileDetails> {
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
        Text(
            'Servis Telefon:${widget.claimDetails!.claimDetails!.claimNumber} '),
        Text('Servis E-Posta: ${widget.claimDetails!.claimDetails!.aslob}'),
        Text('Servis Adres: ${widget.claimDetails!.claimDetails!.aslob}'),
        const SizedBox(height: 8),
        Text(
          "Anlaşmalı Servis :",
          style: Theme.of(context).textTheme.headline6,
        ),
        Text('Servis Telefon: ${widget.claimDetails!.claimDetails!.aslob}'),
        Text('Servis E-Posta: ${widget.claimDetails!.claimDetails!.aslob}'),
        Text('Servis Adres: '),
      ],
    );
  }
}
