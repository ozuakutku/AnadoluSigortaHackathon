import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sigortamcepte/constants/textstyle_consts.dart';
import 'package:sigortamcepte/pages/after_save_file_page.dart';
import 'package:sigortamcepte/pages/location_map_page.dart';
import 'package:sigortamcepte/product/custom_appbar.dart';
import 'package:sigortamcepte/product/custom_text_field.dart';

class AccidentDetailPage extends StatefulWidget {
  @override
  _AccidentDetailPageState createState() => _AccidentDetailPageState();
}

class _AccidentDetailPageState extends State<AccidentDetailPage> {
  TextEditingController aciklamaController = TextEditingController();
  TextEditingController isimController = TextEditingController();
  TextEditingController soyisimController = TextEditingController();
  TextEditingController plaka1Controller = TextEditingController();
  TextEditingController plaka2Controller = TextEditingController();
  TextEditingController plaka3Controller = TextEditingController();
  String? selectedLocation;
  bool mevcutKonumuKullan = true;

  ImagePicker _imagePicker = ImagePicker();
  XFile? _image;
  // Varsayılan olarak mevcut konumu kullan
  String mevcutKonum = "Mevcut Konum";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          TextButton(
              onPressed: () {},
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
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpandedCustomTextField(
                      controller: isimController,
                      prefix: Text("Sigorta Şirketinin adı:")),
                  ExpandedCustomTextField(
                    controller: isimController,
                    prefix: Text("Poliçe Numarası:"),
                  ),
                  ExpandedCustomTextField(
                    controller: isimController,
                    prefix: Text("Adı Soyadı:"),
                  ),
                  ExpandedCustomTextField(
                    controller: isimController,
                    prefix: Text("TC:"),
                  ),
                  ExpandedCustomTextField(
                    controller: isimController,
                    prefix: Text("Poliçe Numarası:"),
                  ),
                  ExpandedCustomTextField(
                    controller: isimController,
                    prefix: Text("Kazanın olduğu şehir:"),
                  ),
                  ExpandedCustomTextField(
                    controller: isimController,
                    prefix: Text("Kaza yapan:"),
                  ),
                  ExpandedCustomTextField(
                    controller: isimController,
                    prefix: Text("Kazanın olduğu İlçe:"),
                  ),
                  ExpandedCustomTextField(
                    controller: isimController,
                    prefix: Text("Sigorta Şirketinin adı:"),
                  ),
                  ExpandedCustomTextField(
                    controller: isimController,
                    prefix: Text("Kaza yapan kişinin yakınlığı:"),
                  ),
                ],
              ),
            ),
            Text(
              "Plaka",
              style: kBlackBoldTextStyle.copyWith(fontSize: 16),
            ),
            Row(
              children: [
                ExpandedCustomTextField(
                    padding: EdgeInsets.only(right: 4),
                    controller: plaka1Controller),
                ExpandedCustomTextField(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    controller: plaka2Controller),
                ExpandedCustomTextField(
                    padding: EdgeInsets.only(left: 4),
                    controller: plaka3Controller),
              ],
            ),
            SizedBox(
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
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Text(
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
                            PlakaNo: "16 BCS 380",
                            ad: "Kadir",
                            soyad: "Yalcin",
                            dosyaTarihi: "16.12.2012",
                            dosyaNo: "31351523",
                            hasarTuru: "Çarpma",
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
                      print("Foto çek");
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
        print("foto çekildi");
      });
    }
  }
}

class ExpandedCustomTextField extends StatelessWidget {
  ExpandedCustomTextField({
    super.key,
    required this.controller,
    this.padding,
    this.prefix,
    this.enable,
  });

  EdgeInsetsGeometry? padding;
  Widget? prefix;
  bool? enable;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: customTextField(
        controller: controller,
        padding: padding,
        prefix: prefix,
        enable: enable,
      ),
    );
  }
}
