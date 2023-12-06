import 'package:flutter/material.dart';
import 'package:sigortamcepte/core/File_details.dart';
import 'package:sigortamcepte/core/info_card.dart';

class FileDetailsPage extends StatelessWidget {
  const FileDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kaza Yaptım Hasar Dosyası'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CrashCarImage(),
            const SizedBox(height: 16),
            DosyaBilgileri(context),
            InfoCard(
              title: 'Servis Bilgileri',
              fileStatus: 'Aktif', // Dosya durumu burada belirtilebilir.
              fileNo: '123456',
              phoneNumber: '+90 123 456 7890',
              email: 'info@sigortamcep.com',
              address: 'Sigorta Caddesi, No: 123, İstanbul',
            ),
          ],
        ),
      ),
    );
  }

  Image CrashCarImage() {
    return Image.asset(
      'assets/crushedcar.jpeg',
      fit: BoxFit.cover,
      height: 200,
    );
  }
}
