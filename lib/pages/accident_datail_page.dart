import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sigortamcepte/constants/textstyle_consts.dart';
import 'package:sigortamcepte/core/accident_details_page_compenents/expanded_custom_text_field.dart';
import 'package:sigortamcepte/core/accident_details_page_compenents/info_fields.dart';
import 'package:sigortamcepte/pages/after_save_file_page.dart';
import 'package:sigortamcepte/pages/location_map_page.dart';
import 'package:sigortamcepte/product/custom_appbar.dart';
import 'package:sigortamcepte/product/custom_text_field.dart';

class AccidentDetailPage extends StatefulWidget {
  @override
  _AccidentDetailPageState createState() => _AccidentDetailPageState();
}

class _AccidentDetailPageState extends State<AccidentDetailPage> {
  TextEditingController sirketNameController = TextEditingController();
  TextEditingController policyController = TextEditingController();
  TextEditingController isimController = TextEditingController();
  TextEditingController tcController = TextEditingController();
  TextEditingController hasarTuruController = TextEditingController();
  TextEditingController sehirController = TextEditingController();
  TextEditingController ilceController = TextEditingController();
  TextEditingController kazaYapanController = TextEditingController();
  TextEditingController yakinlikController = TextEditingController();
  TextEditingController plaka1Controller = TextEditingController();
  TextEditingController plaka2Controller = TextEditingController();
  TextEditingController plaka3Controller = TextEditingController();

  TextEditingController aciklamaController = TextEditingController();
  String? selectedLocation;
  bool mevcutKonumuKullan = false;

  ImagePicker _imagePicker = ImagePicker();
  XFile? _image;
  // Varsayılan olarak mevcut konumu kullan
  String mevcutKonum = "Mevcut Konum";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sirketNameController.text = "Anadolu Sigorta";
    policyController.text = "5272754245";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          TextButton(
              onPressed: () {
                isimController.text = "Kadir Yalçın";
                tcController.text = "11111111111";
                sehirController.text = "Ankara";
                ilceController.text = "Çankaya";
                kazaYapanController.text = "Kadir Yalçın";
                yakinlikController.text = "Kendisi";
                plaka1Controller.text = "06";
                plaka2Controller.text = "TC";
                plaka3Controller.text = "1453";
                setState(() {
                  mevcutKonumuKullan = true;
                });
              },
              child: Text(
                "Otomatik Doldur",
                style: kBlackBoldTextStyle,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            InfoFields(
                sirketNameController: sirketNameController,
                policyController: policyController,
                isimController: isimController,
                tcController: tcController,
                sehirController: sehirController,
                ilceController: ilceController,
                kazaYapanController: kazaYapanController,
                yakinlikController: yakinlikController,
                hasarTuruController: hasarTuruController),
            Text(
              "Plaka",
              style: kBlackBoldTextStyle.copyWith(fontSize: 16),
            ),
            Row(
              children: [
                ExpandedCustomTextField(
                    padding: const EdgeInsets.only(right: 4),
                    keyboardType: TextInputType.number,
                    controller: plaka1Controller),
                ExpandedCustomTextField(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    controller: plaka2Controller),
                ExpandedCustomTextField(
                    padding: const EdgeInsets.only(left: 4),
                    keyboardType: TextInputType.number,
                    controller: plaka3Controller),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      // Harita sayfasını aç ve konumu seç
                      String? location = await _selectLocation(context);
                      if (location != null) {
                        setState(() {
                          selectedLocation = location;
                        });
                      }
                    },
                    child: Text('Konum Seç'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      mevcutKonumuKullan = !mevcutKonumuKullan;
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                          value: mevcutKonumuKullan,
                          onChanged: (value) {
                            setState(() {
                              mevcutKonumuKullan = !mevcutKonumuKullan;
                            });
                          }),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Text(
                          "Mevcut Konumu  Kullan",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            customTextField(
              controller: aciklamaController,
              labelText: "Hasar Açıklaması:",
              maxLines: 5,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Verileri gönder
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AfterSaveFilePage(
                            ilce: ilceController.text,
                            isim: isimController.text,
                            kazaYapanIsim: kazaYapanController.text,
                            kazaYapanYakinlik: yakinlikController.text,
                            plaka:
                                "${plaka1Controller.text} ${plaka2Controller.text} ${plaka3Controller.text}",
                            policeNo: policyController.text,
                            sehir: sehirController.text,
                            sigtortaSirketiAdi: sirketNameController.text,
                            tc: tcController.text,
                            hasarTuru: hasarTuruController.text,
                            konum: selectedLocation ?? 'Mevcut Konum',
                            aciklama: aciklamaController.text,
                          ),
                        ),
                      );
                    },
                    child: Text('Dosyayı Oluştur ve Devam Et'),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _pickImage();
                    },
                    icon: Icon(Icons.camera_alt_outlined)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _selectLocation(BuildContext context) async {
    // Harita sayfasını aç ve konumu seç
    final String? selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationMapPage(),
      ),
    );

    return selectedLocation;
  }

  void _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }
}
