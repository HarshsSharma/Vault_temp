import 'package:flutter/material.dart';

class ScanViewModel extends ChangeNotifier {
  List<String> values = [
    'TAG00112482',
    'TAG00112482',
    'TAG00112482',
    'TAG00112482',
  ];
  bool batchScanning = false;

  toggleBatchScanning() {
    batchScanning = !batchScanning;
    notifyListeners();
  }
}
