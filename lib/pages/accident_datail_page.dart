import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AccidentDetailPage extends StatefulWidget {
  @override
  _AccidentDetailPageState createState() => _AccidentDetailPageState();
}

class _AccidentDetailPageState extends State<AccidentDetailPage> {
  TextEditingController aciklamaController = TextEditingController();
  String? selectedLocation;
  bool mevcutKonumuKullan = true;

  // Varsayılan olarak mevcut konumu kullan
  String mevcutKonum = "Mevcut Konum";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veri Girişi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
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
            SizedBox(height: 16.0),
            Container(
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
            ),
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
