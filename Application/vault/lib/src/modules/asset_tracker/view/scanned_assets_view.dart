import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vault/src/modules/asset_tracker/widget/espanded_asset.dart';

import '../model/assets_model.dart';

class ScannedAssets extends StatelessWidget {
  const ScannedAssets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 228, 228),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: const Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        title: const Text('Scanned Assets'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.clear))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.only(top: 20),
                    itemBuilder: (context, index) {
                      final assets = List.filled(
                        10,
                        AssetsModel(Colors.green, 'Laptop',
                            tagNumber: 'TAG0001258741',
                            modelName: 'Lenovo L530',
                            serialNumber: 'FK100-20',
                            displayName: 'Lenovo L530 S/N FK100-20',
                            latitude: '30.2154745',
                            longtiude: '30.1211124',
                            address: 'A-26, Rish Nagar India'),
                      );
                      return ExpandedAsset(asset: assets[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: 3)),
            MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () {},
              color: const Color(0xff14CB43),
              child: Text(
                'Submit log'.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () {},
              color: const Color(0xff6E789A),
              child: Text(
                'scan agian'.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
