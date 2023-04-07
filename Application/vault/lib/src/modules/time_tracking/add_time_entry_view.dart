// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vault/src/modules/time_tracking/view_model/time_tracking_controller.dart';

import 'add_entry_views/add_entry_views.dart';
import 'model/entry_model.dart';

const primaryColor = Color(0xff1D4295);

class AddTimeEntity extends StatelessWidget {
  final DateTime dateTime;
  const AddTimeEntity({
    Key? key,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        title: const Text('Add Time Entry'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.access_time_sharp,
                    color: primaryColor,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Adding Time Entry',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Text(
                    DateFormat('dd-MMM-yy').format(dateTime).toString(),
                    style: const TextStyle(color: primaryColor, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              EntryField(
                controller:
                    context.read<TimeTrackingViewModel>().entityController,
                hint: 'Entity',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EntryViews(),
                      ));
                  context.read<TimeTrackingViewModel>().currentView = 0;
                  context.read<TimeTrackingViewModel>().selectedRadio = -5;
                  context.read<TimeTrackingViewModel>().beTimeStart();
                },
              ),
              ...context.watch<TimeTrackingViewModel>().otherFields,
              Row(
                children: [
                  Expanded(
                      child: EntryField(
                    controller:
                        context.read<TimeTrackingViewModel>().startController,
                    hint: 'Start Time',
                    onTap: () {},
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: EntryField(
                    controller:
                        context.read<TimeTrackingViewModel>().endController,
                    hint: 'End Time',
                    onTap: () {},
                  )),
                ],
              ),
              EntryField(
                hint: 'Note',
                onTap: () {},
                controller:
                    context.read<TimeTrackingViewModel>().noteController,
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Icon(
                    Icons.access_time_sharp,
                    color: primaryColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Recent Entries',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ...recentEntries
                  .map((e) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          '${e.entryType} > ${e.projectName} > ${e.taskName}',
                          style: const TextStyle(fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}

class EntryField extends StatelessWidget {
  final String hint;
  final VoidCallback onTap;
  final TextEditingController controller;
  const EntryField({
    super.key,
    required this.hint,
    required this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          controller: controller,
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
              labelText: hint,
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 18),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE7EAEC)))),
        ));
  }
}
