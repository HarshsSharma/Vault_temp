import 'package:flutter/material.dart';
import 'package:vault/src/modules/time_off/model/time_off_model.dart';

class TimeOffItem extends StatelessWidget {
  final TimeOffModel timeOff;
  const TimeOffItem({super.key, required this.timeOff});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          timeOff.icon!,
          SizedBox(width: 5),
          Text(
            timeOff.type!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      subtitle: Text(
        timeOff.duration!,
        style: const TextStyle(fontSize: 14, height: 1.8),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            timeOff.status!,
            style: TextStyle(
                color: timeOff.status == 'Approved'
                    ? Color(0xff14CB43)
                    : Color(0xffFF0000),
                fontSize: 18),
          ),
          SizedBox(height: 5),
          Text(
            timeOff.statusDate!,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
