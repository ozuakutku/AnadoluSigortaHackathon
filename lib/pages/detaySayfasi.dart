import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'veritabani.dart';
import 'servisbilgi.dart';

class DetaySayfasi extends StatelessWidget {
  final ServisBilgi servisBilgi;
  final VoidCallback onBack;

  const DetaySayfasi({Key? key, required this.servisBilgi, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detay Sayfası - ${servisBilgi.markerId}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Servis Noktası: ${servisBilgi.markerId}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('İletişim: ${servisBilgi.contactInfo}'),
            SizedBox(height: 8),
            Row(
              children: [
                Text('Puan: ${servisBilgi.rating}/5'),
                SizedBox(width: 8),
                // Burada yıldızları ekleyebilirsiniz
                _buildStarRating(servisBilgi.rating),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    // Burada yıldızları oluşturacak widget'ı döndürebilirsiniz
    // Önceki örnek kodda kullanılan _buildStarRating fonksiyonu kullanılabilir
    // veya kendi tasarımınıza uygun bir yıldız oluşturma yöntemi kullanabilirsiniz.
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
