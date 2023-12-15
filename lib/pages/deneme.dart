import 'package:flutter/material.dart';
import 'ratingQuestionPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Sayfası'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            List<double>? ratings = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RatingQuestionsPage()),
            );

            if (ratings != null) {
              // Değerlendirme sonuçları burada kullanılabilir
              print('Alınan değerler: $ratings');
            }
          },
          child: Text('Yıldız Derecelendirme Sorularını Göster'),
        ),
      ),
    );
  }
}
