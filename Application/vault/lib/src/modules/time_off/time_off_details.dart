import 'package:flutter/material.dart';
import 'package:vault/src/modules/time_off/remove_request.dart';
import 'package:vault/src/modules/time_off/widgets/details_item.dart';

class TimeOffDetails extends StatelessWidget {
  const TimeOffDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
        title: const Text('Time Off Details'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RemoveRequest()));
              },
              icon: const Icon(Icons.delete_outline_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TimeOffDetailsItem(
                label: 'Status',
                contentBody: 'Approved',
                textStyle: TextStyle(color: Color(0xff14CB43), fontSize: 18),
              ),
              TimeOffDetailsItem(
                label: 'Time Off Approvers',
                content: SizedBox(
                  height: 40,
                  child: Stack(
                    children: List.generate(
                        5,
                        (index) => Positioned(
                              left: index * 25,
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 18,
                                ),
                              ),
                            )),
                  ),
                ),
              ),
              const TimeOffDetailsItem(
                label: 'Type',
                isRequired: true,
                contentBody: 'Holiday (5.5 days)',
                textStyle: TextStyle(fontSize: 18),
              ),
              const TimeOffDetailsItem(
                label: 'Day Part',
                isRequired: true,
                contentBody: 'Multi Day',
                textStyle: TextStyle(fontSize: 18),
              ),
              const TimeOffDetailsItem(
                label: 'Duration',
                contentBody: '3 days (06-Dec-19 - 08-Dec-19)',
                textStyle: TextStyle(fontSize: 18),
              ),
              const TimeOffDetailsItem(
                label: 'Request Message',
                isRequired: true,
                contentBody: 'Approved by John Smith. Covered by Jane Doe.',
                textStyle: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
