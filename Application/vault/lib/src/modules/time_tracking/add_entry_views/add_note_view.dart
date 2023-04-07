import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/time_tracking_controller.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        minLines: 5,
        controller: context.read<TimeTrackingViewModel>().noteController,
        maxLines: 10,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
            hintText: 'Note',
            hintStyle: TextStyle(fontSize: 18),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE7EAEC)))));
  }
}
