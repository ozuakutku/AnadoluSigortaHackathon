import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigortamcepte/core/File_details.dart';
import 'package:sigortamcepte/core/File_summary.dart';
import 'package:sigortamcepte/service/datas.dart';

class FileDetailsPage extends StatefulWidget {
  FileDetailsPage({Key? key, this.index}) : super(key: key);
  var index;
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
                    provider.claimDetails[0],
                  ),
                  FileDetails(
                    claimDetails: provider.claimDetails[0],
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
