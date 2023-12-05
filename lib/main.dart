
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SigortamCep',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kaza Yaptım Hasar Dosyası'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/png-clipart-insurance-accident-personal-injury-lawyer-car-accident-car-insurance.png', // Değişen resim yolu
            fit: BoxFit.cover,
            height: 200,
          ),
          const SizedBox(height: 16),
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
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String fileStatus;
  final String fileNo;
  final String phoneNumber;
  final String email;
  final String address;

  const InfoCard({
    Key? key,
    required this.title,
    required this.fileStatus,
    required this.fileNo,
    required this.phoneNumber,
    required this.email,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            Text('Dosya Durumu: $fileStatus'),
            Text('Dosya No: $fileNo'),
            const SizedBox(height: 8),
            Text('Servis Telefon: $phoneNumber'),
            Text('Servis E-Posta: $email'),
            Text('Servis Adres: $address'),
          ],
        ),
      ),
    );
  }
}
