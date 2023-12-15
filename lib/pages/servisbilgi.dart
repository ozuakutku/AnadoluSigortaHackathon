class ServisBilgi {
  String markerId;
  String contactInfo;
  double rating; // Rating field'ı ekledik
  double latitude;
  double longitude;

  ServisBilgi({
    required this.markerId,
    required this.contactInfo,
    required this.rating,
    required this.latitude,
    required this.longitude,
  });
}
