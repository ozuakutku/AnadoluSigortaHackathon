import 'package:flutter/material.dart';
import 'package:sigortamcepte/core/File_details.dart';
import 'package:sigortamcepte/core/File_summary.dart';
import 'package:sigortamcepte/models/dosya_detaylari_servisi_model.dart';
import 'package:sigortamcepte/service/api_service.dart';

class FileDetailsPage extends StatefulWidget {
  const FileDetailsPage({Key? key}) : super(key: key);

  @override
  State<FileDetailsPage> createState() => _FileDetailsPageState();
}

class _FileDetailsPageState extends State<FileDetailsPage> {
  apiService claimDetailsService = apiService();
  ClaimDetails? claimDetails;

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    claimDetailsService.fetchFileDetails().then((value) {
      setState(() {
        claimDetails = value;
        isLoading = false;
        print(("${claimDetails!.claimDetails!.claimNumber}"));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kaza Yaptım Hasar Dosyası'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CrashCarImage(),
                  const SizedBox(height: 16),
                  FileSummary(
                    context,
                    claimDetails,
                  ),
                  FileDetails(
                    claimDetails: claimDetails,
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
