import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:vault/src/core/helper/extentions/media_query.dart';
import 'package:vault/src/modules/asset_tracker/view/scan_qr.dart';

import '../../../core/components/list_view_tab.dart';
import '../controller/scan_conroller.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 221, 221),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        title: const Text('Dashboard'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            color: Colors.white,
            height: context.height * .3 < 250 ? 250 : context.height * .3,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                'Welcome',
                textScaleFactor: ScaleSize.textScaleFactor(context),
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: context.height * .01),
              Text(
                'Your last action was completed\n 1 month ago',
                textScaleFactor: ScaleSize.textScaleFactor(context),
                style: const TextStyle(fontSize: 20, height: 1.5),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.height * .02),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                  create: (context) => ScanViewModel(),
                                  child: const ScanQr(),
                                )));
                  },
                  elevation: 0,
                  height: context.height * .08,
                  minWidth: double.infinity,
                  color: const Color(0xff14CB43),
                  child: Text(
                    'Start Scanning'.toUpperCase(),
                    textScaleFactor: ScaleSize.textScaleFactor(context),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ]),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: context.height * .02),
            child: Text(
              'Prevoius actions'.toUpperCase(),
              textScaleFactor: ScaleSize.textScaleFactor(context),
            ),
          ),
          const Divider(
            height: 0,
            endIndent: 20,
            color: Color.fromARGB(255, 83, 81, 81),
            indent: 20,
          ),
          const SizedBox(height: 5),
          Expanded(
              child: ListViewWithTab(
            length: 20,
            listItem: (p0, p1) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Check In',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '1 month ago (29-Feb-2023)',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        )
                      ],
                    ),
                    const Text(
                      '4 items',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              );
            },
            separated: (BuildContext, int) {
              return SizedBox();
            },
          ))
        ],
      ),
    );
  }
}
