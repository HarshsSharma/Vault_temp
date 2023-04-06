import 'package:flutter/material.dart';

import '../time_off_details.dart';

class TimeOffItem extends StatelessWidget {
  const TimeOffItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onTap: () {
      //   // Navigator.push(
      //   //     context,
      //   //     MaterialPageRoute(
      //   //       builder: (context) => const TimeOffDetails(),
      //   //     ));
      // },
      title: Row(
        children: const [
          Icon(
            Icons.work_outline_sharp,
            color: Colors.blue,
          ),
          SizedBox(width: 5),
          Text(
            'Holiday',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      subtitle: const Text(
        '4 days (12-Nov-19 - 15-Nov-19)',
        style: TextStyle(fontSize: 14, height: 1.8),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            'Approved',
            style: TextStyle(color: Color(0xff14CB43), fontSize: 18),
          ),
          SizedBox(height: 5),
          Text(
            '28-Mar-23',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
