import 'package:flutter/material.dart';
import 'package:vault/src/modules/time_off/model/time_off_req_model.dart';

class AbsenceItem extends StatelessWidget {
  final VoidCallback? onTap;
  final TimeOffReq timeOffReq;
  const AbsenceItem({super.key, this.onTap, required this.timeOffReq});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.amber,
      ),
      title: Text(
        timeOffReq.name!,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        timeOffReq.duration!,
        style: const TextStyle(fontSize: 14),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Icon(
            Icons.medical_services_outlined,
            color: Colors.deepOrange,
          ),
          const SizedBox(height: 5),
          Text(
            timeOffReq.country,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
