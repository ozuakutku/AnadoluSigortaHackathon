import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationMapPage extends StatefulWidget {
  @override
  _LocationMapPageState createState() => _LocationMapPageState();
}

class _LocationMapPageState extends State<LocationMapPage> {
  late GoogleMapController mapController;
  LatLng? currentLocation;

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
          target: currentLocation ?? LatLng(0.0, 0.0),
          zoom: 12,
        ),
        markers: currentLocation != null
            ? {
                Marker(
                  markerId: MarkerId('currentLocation'),
                  position: currentLocation!,
                  infoWindow: InfoWindow(
                    title: 'Mevcut Konum',
                  ),
                ),
              }
            : {},
        onTap: (latLng) {
          setState(() {
            currentLocation = latLng;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Konumu seç ve kapat
          if (currentLocation != null) {
            Navigator.pop(
              context,
              '(${currentLocation!.latitude}, ${currentLocation!.longitude})',
            );
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
