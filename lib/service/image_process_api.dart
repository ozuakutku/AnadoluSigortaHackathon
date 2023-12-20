import 'dart:io';
import 'package:http/http.dart' as http;

Future<String?> sendImageToServer(String imagePath) async {
  try {
    final url = Uri.parse('http://localhost:5000/process_image');

    // Gönderilecek olan resmi bir dosya olarak hazırla
    final File imageFile = File(imagePath);

    // HTTP isteği oluştur
    final request = http.MultipartRequest('POST', url)
      ..files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
        ),
      );

    // İsteği gönder ve yanıtı al
    final response = await request.send();

    // Yanıtı oku
    final String responseData = await response.stream.bytesToString();

    // Yanıtı kullan
    print('Server response: $responseData');
    return responseData;
  } catch (e) {
    print("Error sending image to server: $e");
  }
}
