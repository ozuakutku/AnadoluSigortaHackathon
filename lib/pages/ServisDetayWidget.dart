import 'package:flutter/material.dart';

class ServisDetayWidget extends StatelessWidget {
  final String markerId;
  final String contactInfo;
  final double rating;

  const ServisDetayWidget({
    Key? key,
    required this.markerId,
    required this.contactInfo,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [ // Bir gölge ekleyerek daha belirgin bir arka plan oluşturabilirsiniz
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Servis Noktası: $markerId', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('İletişim: $contactInfo'),
          SizedBox(height: 8),
          Row(
            children: [
              Text('Puan: $rating/5'),
              SizedBox(width: 8),
              // Burada yıldızları ekleyebilirsiniz
              _buildStarRating(rating),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(double rating) {
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
}
