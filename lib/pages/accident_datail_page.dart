import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sigortamcepte/pages/haritadeneme.dart';

class AccidentDetailPage extends StatefulWidget {
  @override
  _AccidentDetailPageState createState() => _AccidentDetailPageState();
}

class _AccidentDetailPageState extends State<AccidentDetailPage> {
  TextEditingController aciklamaController = TextEditingController();
  TextEditingController isimController = TextEditingController();
  TextEditingController soyisimController = TextEditingController();
  TextEditingController adresController = TextEditingController();
  TextEditingController plakaController = TextEditingController();

  String? selectedLocation;
  bool mevcutKonumuKullan = true;

  // Varsayılan olarak mevcut konumu kullan
  String mevcutKonum = "Mevcut Konum";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veri Girişi'),
        actions: [TextButton(onPressed: () {}, child: Text("Otomatik Doldur"))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTextField(isimController: isimController, labelText: "İsim"),
            CustomTextField(
                isimController: isimController, labelText: "Soyisim"),
            Text("Plaka"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomTextField(
                      isimController: isimController, labelText: "Plaka"),
                ),
                Expanded(
                  child: CustomTextField(
                      isimController: isimController, labelText: "Plaka"),
                ),
                Expanded(
                  child: CustomTextField(
                      isimController: isimController, labelText: "Plaka"),
                ),
              ],
            ),
            CustomTextField(isimController: isimController, labelText: "Adres"),
            getLocationButton(context),
            SizedBox(height: 16.0),
            DetailBox(aciklamaController: aciklamaController),
            SizedBox(height: 16.0),
            ElevatedButton(
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
              child: Text('Verileri Gönder'),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton getLocationButton(BuildContext context) {
    return ElevatedButton(
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
    );
  }

  Future<String?> _selectLocation(
    BuildContext context,
  ) async {
    // Harita sayfasını aç ve konumu seç
    final String? selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationMapPage(),
      ),
    );

    return selectedLocation;
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.isimController,
    required this.labelText,
  });

  final TextEditingController isimController;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.blue),
        ),
        child: TextField(
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10.0),
          ),
          controller: isimController,
        ),
      ),
    );
  }
}

class DetailBox extends StatelessWidget {
  const DetailBox({
    super.key,
    required this.aciklamaController,
  });

  final TextEditingController aciklamaController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.blue),
      ),
      child: TextField(
        controller: aciklamaController,
        maxLines: 5,
        decoration: InputDecoration(
          labelText: 'Hasar Açıklaması',
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

  // Mevcut konumu almak için kullanılacak fonksiyon
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Konum servisi etkin mi kontrol et
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Eğer kapalı ise kullanıcıyı konum servisini açmaya yönlendir
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        // Eğer kullanıcı konum servisini açmazsa hata ver
        throw 'Konum servisi kapalı';
      }
    }

    // Konum izni al
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Eğer izin verilmezse hata ver
        throw 'Konum izni verilmedi';
      }
    }

    // Mevcut konumu al
    return await Geolocator.getCurrentPosition();
  }
}
