import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sigortamcepte/models/dosya_detaylari_servisi_model.dart';
import 'package:sigortamcepte/service/api_service.dart';

class Datas with ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  apiService claimDetailsService = apiService();
  List<ClaimDetails?> claimDetails = [];
  bool isLoading = true;
  bool get isLoadingGetter => isLoading;
  Future<void> getDatas() async {
    claimDetailsService.fetchFileDetails().then((value) {
      claimDetails.add(value);

      isLoading = false;

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
