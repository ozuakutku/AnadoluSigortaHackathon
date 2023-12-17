import 'package:flutter/material.dart';
import 'package:sigortamcepte/models/dosya_detaylari_servisi_model.dart';
import 'package:sigortamcepte/service/api_service.dart';

class Datas with ChangeNotifier {
  apiService claimDetailsService = apiService();
  ClaimDetails? claimDetails;
  bool isLoading = true;
  bool get isLoadingGetter => isLoading;
  Future<void> getDatas() async {
    claimDetailsService.fetchFileDetails().then((value) {
      claimDetails = value;
      isLoading = false;
      print(("${claimDetails!.claimDetails!.claimNumber}"));
      notifyListeners();
    });
  }

  String? name;
  nameSetter(String name) {
    this.name = name;
    notifyListeners();
  }

  String? get nameGetter => name;
}
