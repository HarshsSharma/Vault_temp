// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

import '../../../core/components/qr_scanner.dart';
import '../controller/scan_conroller.dart';

// ignore: must_be_immutable
class ScanQr extends StatelessWidget {
  const ScanQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff161652),
          toolbarHeight: kToolbarHeight,
          title: const Text('Scan QR Code'),
          actions: [
            if (context.watch<ScanViewModel>().batchScanning)
              IconButton(onPressed: () {}, icon: const Icon(Icons.check))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              height: kToolbarHeight,
              child: Row(
                children: [
                  const Text(
                    'Enable/Disable Batch Scanning',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Switch(
                    value: context.watch<ScanViewModel>().batchScanning,
                    onChanged: (value) {
                      context.read<ScanViewModel>().toggleBatchScanning();
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  )
                ],
              ),
            ),
            if (context.watch<ScanViewModel>().batchScanning)
              Container(
                height: kToolbarHeight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white,
                child: Row(
                  children: [
                    const Text(
                      'Scanned Items',
                      style: TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  tileMode: TileMode.decal,
                                  colors: [Colors.green, Colors.blue])),
                          height: 40,
                          width: 40,
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          height: 35,
                          width: 35,
                          child: Text(
                              context
                                  .watch<ScanViewModel>()
                                  .values
                                  .length
                                  .toString(),
                              style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            if (context.watch<ScanViewModel>().batchScanning &&
                context.watch<ScanViewModel>().values.isNotEmpty)
              Container(
                  height: kToolbarHeight,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.white,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 117, 186, 243),
                        ),
                        child: Row(
                          children: [
                            Text(
                              context.watch<ScanViewModel>().values[index],
                              style: const TextStyle(
                                color: Color(0xff161652),
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 5),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.clear),
                              padding: const EdgeInsets.all(5),
                              constraints: const BoxConstraints(),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                    itemCount: context.watch<ScanViewModel>().values.length,
                  )),
            Expanded(
              child: QRCodeScanner(
                controller: MobileScannerController(
                    detectionSpeed: DetectionSpeed.noDuplicates),
                onDetect: (p0) {},
              ),
            ),
          ],
        ));
  }
}
