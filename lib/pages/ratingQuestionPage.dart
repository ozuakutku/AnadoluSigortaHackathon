import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'veritabani.dart';
import 'servisbilgi.dart';


class RatingQuestionsPage extends StatefulWidget {
  @override
  _RatingQuestionsPageState createState() => _RatingQuestionsPageState();
}

class _RatingQuestionsPageState extends State<RatingQuestionsPage> {
  List<double> _ratings = [0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yıldız Derecelendirme Soruları'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildQuestion(0, 'Soru 1: ...'),
            _buildQuestion(1, 'Soru 2: ...'),
            _buildQuestion(2, 'Soru 3: ...'),
            _buildQuestion(3, 'Soru 4: ...'),
            _buildQuestion(4, 'Soru 5: ...'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateRating("Servis Noktası 1");
              },
              child: Text('Gönder'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(int index, String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question),
        RatingBar.builder(
          initialRating: _ratings[index],
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 40,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _ratings[index] = rating;
            });
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }

  void updateRating(String selectedMarkerId) {
    // Ortalamayı hesapla
    double averageRating = _ratings.reduce((a, b) => a + b) / _ratings.length;

    // Bu değeri kullanarak seçilen servis bilgisini güncelle
    ServisBilgi? selectedService = Veritabani.servisBilgileri.firstWhereOrNull((servis) => servis.markerId == selectedMarkerId);

    if (selectedService != null) {
      selectedService.rating = averageRating;

      // RatingQuestionsPage'i kapat ve değerleri geri gönder
      Navigator.pop(context, _ratings);
    } else {
      // Seçilen servis bulunamazsa durumunu ele al
      print('Hata: Seçilen servis bulunamadı.');
    }
  }

}
