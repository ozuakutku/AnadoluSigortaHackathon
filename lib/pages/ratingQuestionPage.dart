import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                Navigator.pop(context, _ratings);
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
}
