import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sigortamcepte/models/dosya_detaylari_servisi_model.dart';

class apiService {
  Future<ClaimDetails?> fetchFileDetails() async {
    var res = await http.post(
      Uri.parse(
        'https://apigwtest.anadolusigorta.com.tr/api/agency/hackathon-api/getClaimDetailsService',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'x-ibm-client-id': '228a238a3ba0ce130931fcb6839780be',
        'x-ibm-client-secret': 'ff7400d16d81e787e42f1a8759161bcf',
      },
      body: jsonEncode({
        "ClaimNumber": "13334751230001",
        "IncludePayeeData": true,
        "LineId": null,
      }),
    );
    if (res.statusCode == 200) {
      print(res.statusCode.toString());
      final decodedData = utf8.decode(res.bodyBytes);
      ClaimDetails jsonBody = ClaimDetails.fromJson(jsonDecode(decodedData));

      return jsonBody;
    }
  }
}
