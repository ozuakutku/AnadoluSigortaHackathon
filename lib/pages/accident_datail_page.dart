import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sigortamcepte/constants/textstyle_consts.dart';
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
                controller: isimController, hintText: "İsim", border: false),
            customTextField(
                controller: soyisimController,
                hintText: "Soyisim",
                border: false),
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
                          builder: (context) => OutputPage(
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
                    onPressed: () {}, icon: Icon(Icons.camera_alt_outlined))
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
}

class customTextField extends StatelessWidget {
  customTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.maxLines,
    this.padding,
    this.border,
  });
  bool? border = true;
  EdgeInsetsGeometry? padding;
  String? hintText;
  int? maxLines = 1;
  final TextEditingController controller;

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

class OutputPage extends StatelessWidget {
  final String konum;
  final String aciklama;

  OutputPage({required this.konum, required this.aciklama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alınan Veriler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Konum: $konum'),
            SizedBox(height: 16.0),
            Text('Hasar Açıklaması: $aciklama'),
          ],
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
