import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigortamcepte/core/File_details.dart';
import 'package:sigortamcepte/core/File_summary.dart';
import 'package:sigortamcepte/models/dosya_detaylari_servisi_model.dart';
import 'package:sigortamcepte/service/api_service.dart';
import 'package:sigortamcepte/service/datas.dart';

class FileDetailsPage extends StatefulWidget {
  const FileDetailsPage({Key? key}) : super(key: key);

  @override
  State<FileDetailsPage> createState() => _FileDetailsPageState();
}

class _FileDetailsPageState extends State<FileDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kaza Yaptım Hasar Dosyası'),
        ),
        body: Consumer<Datas>(
          builder: (ccontext, provider, child) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CrashCarImage(),
                  const SizedBox(height: 16),
                  FileSummary(
                    context,
                    provider.claimDetails,
                  ),
                  FileDetails(
                    claimDetails: provider.claimDetails,
                  ),
                ],
              ),
            );
          },
        ));
  }

  Image CrashCarImage() {
    return Image.asset(
      'assets/crushedcar.jpeg',
      fit: BoxFit.cover,
      height: 200,
    );
  }
}
