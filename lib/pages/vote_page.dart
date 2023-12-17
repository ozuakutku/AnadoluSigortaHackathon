import 'package:flutter/material.dart';

class VotePage extends StatefulWidget {
  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ürün Değerlendirmesi'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align text to the top
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RatingWidget(title: 'Kalite'),
              RatingWidget(title: 'Hız'),
              RatingWidget(title: 'Memnuniyet'),
              SizedBox(height: 10),
              CommentWidget(),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  sendFeedback();
                },
                child: Text('Gönder'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendFeedback() {
    print('Değerlendirmeler ve yorum gönderildi!');
  }
}

class RatingWidget extends StatefulWidget {
  final String title;

  RatingWidget({required this.title});

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i <= 5; i++)
              IconButton(
                icon: Icon(
                  i <= _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 45,
                ),
                onPressed: () {
                  setState(() {
                    _rating = i.toDouble();
                  });
                },
              ),
          ],
        ),
        Text(
          'Puan: $_rating',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class CommentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Yorumunuzu buraya yazın...',
          border: OutlineInputBorder(),
        ),
        maxLines: 3,
      ),
    );
  }
}
