import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:vault/src/modules/asset_tracker/model/assets_model.dart';

import '../../../core/helper/service/service.dart';
import '../view/scan_qr_view.dart';

class ScanViewModel extends ChangeNotifier {
  List<String> values = [
    'TAG00112482',
    'TAG00112482',
    'TAG00112482',
    'TAG00112482',
  ];
  List<AssetsModel> assets = [
    AssetsModel(Colors.green, 'Laptop',
        tagNumber: 'TAG0001258741',
        modelName: 'Lenovo L530',
        serialNumber: 'FK100-20',
        displayName: 'Lenovo L530 S/N FK100-20',
        latitude: '30.2154745',
        longtiude: '30.1211124',
        address: 'A-26, Rish Nagar India'),
  ];
  bool batchScanning = false;

  toggleBatchScanning() {
    batchScanning = !batchScanning;
    notifyListeners();
  }

  void navigate(BuildContext context) async {
    final isGranted =
        await PermissionService.requestPermission(Permission.camera);
    if (isGranted && context.mounted) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                    create: (context) => ScanViewModel(),
                    child: const ScanQr(),
                  )));
    }
  }
}
