import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vault/src/core/components/list_view_tab.dart';
import 'package:vault/src/modules/time_off/time_off_details.dart';
import 'package:vault/src/modules/time_off/time_off_req.dart';
import 'package:vault/src/modules/time_off/view_model/time_off_view_model.dart';
import 'package:vault/src/modules/time_off/widgets/absence_item.dart';
import 'package:vault/src/modules/time_off/widgets/time_off_item.dart';

import '../../core/components/tap_bar.dart';
import 'add_time_off.dart';

class TimeOff extends StatefulWidget {
  const TimeOff({super.key});

  @override
  State<TimeOff> createState() => _TimeOffState();
}

class _TimeOffState extends State<TimeOff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        title: const Text('Time Off'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          CustomTapBar(
            children: [
              TabBarItem(label: 'My Time Off'),
              TabBarItem(label: 'Time Off Requests'),
            ],
            onChanged: context.read<TimeOffViewModel>().toggleTimeOffTab,
          ),
          if (context.watch<TimeOffViewModel>().timeOffTab == 0)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                  const Text(
                    '2023',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {}),
                ],
              ),
            ),
          if (context.watch<TimeOffViewModel>().timeOffTab == 0)
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xffF6F6F6),
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Color(0xffE3E3E3)))),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: holidayTypes
                    .map((e) => Expanded(
                            child: Text(
                          e,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff676A6C),
                              fontWeight: FontWeight.bold),
                        )))
                    .toList(),
              ),
            ),
          Expanded(
              child: ListViewWithTab(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            context.watch<TimeOffViewModel>().timeOffTab == 0
                                ? const TimeOffDetails()
                                : const TimeOffRequests(),
                      )),
                  listItem: (context, index) {
                    return context.watch<TimeOffViewModel>().timeOffTab == 0
                        ? TimeOffItem(
                            timeOff: context
                                .watch<TimeOffViewModel>()
                                .timesOff[index],
                          )
                        : AbsenceItem(
                            timeOffReq: context
                                .watch<TimeOffViewModel>()
                                .timesOffRequests[index],
                          );
                  },
                  separated: (context, index) {
                    return const Divider();
                  },
                  length: context.watch<TimeOffViewModel>().timeOffTab == 0
                      ? context.watch<TimeOffViewModel>().timesOff.length
                      : context
                          .watch<TimeOffViewModel>()
                          .timesOffRequests
                          .length))
        ],
      ),
      floatingActionButton: context.watch<TimeOffViewModel>().timeOffTab == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddTimeOff(),
                    ));
              },
              backgroundColor: const Color(0xff161652),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

List<String> holidayTypes = [
  '- BT',
  '0/2 SD',
  '- BN',
  '- OT',
  '5.5/25 HD',
];
