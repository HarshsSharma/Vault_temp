import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vault/src/modules/time_off/widgets/absence_item.dart';

import '../../core/components/tap_bar.dart';

class AbsenseScreen extends StatelessWidget {
  const AbsenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
        title: const Text('Absences'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          CustomTapBar(
            children: [
              TabBarItem(label: 'Today', count: 10),
              TabBarItem(label: 'Upcoming', count: 22),
              TabBarItem(label: 'Holidays', count: 1),
            ],
            onChanged: (value) {
              log(value.toString());
            },
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const AbsenceItem();
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: 20))
        ],
      ),
    );
  }
}
