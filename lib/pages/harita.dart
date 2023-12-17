import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'veritabani.dart';
import 'servisbilgi.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> _markers = {};
  Marker? _selectedMarker;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _center = LatLng(position.latitude, position.longitude);
    });

    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: _center,
        zoom: 15.0,
      ),
    ));

    _markers.clear();

    for (var servisBilgi in Veritabani.servisBilgileri) {
      _addMarker(
        LatLng(servisBilgi.latitude, servisBilgi.longitude),
        servisBilgi.markerId,
        servisBilgi.contactInfo,
        servisBilgi.rating,
      );
    }
  }

  void _addMarker(LatLng position, String markerId, String contactInfo,
      double defaultRating) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(markerId),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: InfoWindow(
            onTap: () {
              _onMarkerTapped(MarkerId(markerId));
            },
            title: markerId,
            snippet: 'Puan: $defaultRating/5',
          ),
          onTap: () {
            _onMarkerTapped(MarkerId(markerId));
          },
        ),
      );
    });
  }

  void _onMarkerTapped(MarkerId markerId) {
    if (_selectedMarker == null || _selectedMarker!.markerId != markerId) {
      setState(() {
        _selectedMarker =
            _markers.firstWhere((marker) => marker.markerId == markerId);
      });
    } else {
      // Seçilen marker ile eşleşen ServisBilgi'yi bul
      ServisBilgi selectedServisBilgi = Veritabani.servisBilgileri.firstWhere(
          (servis) => servis.markerId == _selectedMarker!.markerId.value);

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Servis Noktası: ${_selectedMarker!.markerId.value}'),
                SizedBox(height: 8),
                Text('İletişim: ${selectedServisBilgi.contactInfo}'),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text('Puan: '),
                    SizedBox(width: 8),
                    // Burada yıldızları ekleyebilirsiniz
                    _buildStarRating(selectedServisBilgi.rating),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }

  Widget _buildStarRating(double? rating) {
    if (rating == null) return Container();

    int filledStars = rating.floor();
    int halfStars = ((rating - filledStars) * 2).round();
    int emptyStars = 5 - filledStars - halfStars;

    return Row(
      children: List.generate(
            filledStars,
            (index) => Icon(Icons.star, color: Colors.yellow, size: 20),
          ) +
          List.generate(
            halfStars,
            (index) => Icon(Icons.star_half, color: Colors.yellow, size: 20),
          ) +
          List.generate(
            emptyStars,
            (index) => Icon(Icons.star_border, color: Colors.grey, size: 20),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harita Uygulaması'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        myLocationEnabled: true,
        markers: _markers,
        onTap: (LatLng latLng) {
          if (_selectedMarker != null) {
            setState(() {
              _selectedMarker = null;
            });
          }
        },
      ),
    );
  }
}
