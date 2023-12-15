import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sigortamcepte/constants/textstyle_consts.dart';
import 'package:sigortamcepte/pages/after_save_file_page.dart';
import 'package:sigortamcepte/product/custom_appbar.dart';

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
            customTextField(
              controller: isimController,
              hintText: "İsim:",
              border: false,
            ),
            customTextField(
              controller: soyisimController,
              hintText: "Soyisim:",
              border: false,
            ),
            Text(
              "Plaka",
              style: kBlackBoldTextStyle.copyWith(fontSize: 16),
            ),
            Row(
              children: [
                Expanded(
                    child: customTextField(
                        padding: EdgeInsets.only(right: 4),
                        controller: plaka1Controller)),
                Expanded(
                    child: customTextField(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        controller: plaka2Controller)),
                Expanded(
                    child: customTextField(
                        padding: EdgeInsets.only(left: 4),
                        controller: plaka3Controller)),
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
                          value: mevcutKonumuKullan, onChanged: (value) {}),
                      Text(
                        "Mevcut Konumu \n Kullan",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            customTextField(
              controller: aciklamaController,
              hintText: "Hasar Açıklaması",
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
        builder: (context) => accMapPage(),
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

class customTextField extends StatelessWidget {
  bool border;
  EdgeInsetsGeometry? padding;
  String? hintText;
  int? maxLines;
  final TextEditingController controller;
  customTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.maxLines = 1,
    this.border = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    print("durum ");
    return Container(
      margin: padding ?? EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: border == true ? Border.all(color: Colors.blue) : null,
      ),
      child: TextField(
        controller: controller,
        maxLines: this.maxLines,
        decoration: InputDecoration(
          labelText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}

class accMapPage extends StatefulWidget {
  @override
  _accMapPageState createState() => _accMapPageState();
}

class _accMapPageState extends State<accMapPage> {
  late GoogleMapController mapController;
  LatLng? selectedLatLng;
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konum Seç'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(0.0, 0.0),
          zoom: 2,
        ),
        markers: markers,
        onTap: (latLng) {
          setState(() {
            selectedLatLng = latLng;
            markers.clear();
            markers.add(
              Marker(
                markerId: MarkerId('selectedLocation'),
                position: selectedLatLng!,
                infoWindow: InfoWindow(
                  title: 'Seçilen Konum',
                ),
              ),
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Konumu seç ve kapat
          if (selectedLatLng != null) {
            Navigator.pop(
              context,
              '(${selectedLatLng!.latitude}, ${selectedLatLng!.longitude})',
            );
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
