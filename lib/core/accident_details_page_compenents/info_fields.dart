import 'package:flutter/material.dart';
import 'package:sigortamcepte/core/accident_details_page_compenents/expanded_custom_text_field.dart';

class InfoFields extends StatelessWidget {
  const InfoFields({
    super.key,
    required this.sirketNameController,
    required this.policyController,
    required this.isimController,
    required this.tcController,
    required this.sehirController,
    required this.ilceController,
    required this.kazaYapanController,
    required this.yakinlikController,
    required this.hasarTuruController,
  });
  final TextEditingController hasarTuruController;
  final TextEditingController sirketNameController;
  final TextEditingController policyController;
  final TextEditingController isimController;
  final TextEditingController tcController;
  final TextEditingController sehirController;
  final TextEditingController ilceController;
  final TextEditingController kazaYapanController;
  final TextEditingController yakinlikController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpandedCustomTextField(
              controller: sirketNameController,
              prefix: Text("Sigorta Şirketinin adı:")),
          ExpandedCustomTextField(
            controller: policyController,
            prefix: Text("Poliçe Numarası:"),
          ),
          ExpandedCustomTextField(
            controller: isimController,
            prefix: Text("Adı Soyadı:"),
          ),
          ExpandedCustomTextField(
            controller: tcController,
            prefix: Text("TC:"),
          ),
          ExpandedCustomTextField(
            controller: sehirController,
            prefix: Text("Kazanın olduğu şehir:"),
          ),
          ExpandedCustomTextField(
            controller: ilceController,
            prefix: Text("Kazanın olduğu İlçe:"),
          ),
          ExpandedCustomTextField(
            controller: kazaYapanController,
            prefix: Text("Kaza yapan kişinin Adı soyadı:"),
          ),
          ExpandedCustomTextField(
            controller: yakinlikController,
            prefix: Text("Kaza yapan kişinin yakınlığı:"),
          ),
          ExpandedCustomTextField(
            controller: hasarTuruController,
            prefix: Text("Hasar türü:"),
          ),
        ],
      ),
    );
  }
}
