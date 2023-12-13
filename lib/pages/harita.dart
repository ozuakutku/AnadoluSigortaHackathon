import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'veritabani.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Harita(),
    );
  }
}

class Harita extends StatefulWidget {
  const Harita({Key? key}) : super(key: key);

  @override
  _HaritaState createState() => _HaritaState();
}

class _HaritaState extends State<Harita> {
  late GoogleMapController mapController;
  LatLng _center = const LatLng(0, 0);

  Set<Marker> _markers = {};
  Marker? _selectedMarker;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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

  void _addMarker(LatLng position, String markerId, String contactInfo, double defaultRating) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(markerId),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: InfoWindow(
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
        _selectedMarker = _markers.firstWhere((marker) => marker.markerId == markerId);
      });
    } else {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 100,
            child: Center(
              child: Column(
                children: [
                  Text('Servis Noktası: ${_selectedMarker!.markerId.value}'),
                  Text('İletişim: ${_selectedMarker!.infoWindow.snippet ?? ""}'),
                  Row(
                    children: [
                      Text('Puan: ${_selectedMarker!.infoWindow.snippet?.split(' ')[1] ?? ""}'),
                      // Burada yıldızları ekleyebilirsiniz
                      _buildStarRating(_selectedMarker!.infoWindow.snippet?.split(' ')[1]),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  Widget _buildStarRating(String? rating) {
    if (rating == null) return Container();

    double doubleRating = double.tryParse(rating.split('/')[0]) ?? 0;

    int filledStars = doubleRating.floor();
    int halfStars = ((doubleRating - filledStars) * 2).round();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ana sayfaya geri dön
          Navigator.pop(context);
        },
        tooltip: 'Ana Sayfa',
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
