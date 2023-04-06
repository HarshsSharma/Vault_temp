import 'package:flutter/material.dart';
import 'package:vault/src/modules/time_off/widgets/details_item.dart';

class TimeOffRequests extends StatelessWidget {
  const TimeOffRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
        backgroundColor: const Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        title: const Text('Time Off Requests'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.amber,
              ),
              title: Text(
                'Ali Hassan Ali',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                'Junior Programmer',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  TimeOffDetailsItem(
                    label: 'Type',
                    isRequired: true,
                    contentBody: 'Holiday (5.5 days)',
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  TimeOffDetailsItem(
                    label: 'Day Part',
                    isRequired: true,
                    contentBody: 'Multi Day',
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  TimeOffDetailsItem(
                    label: 'Duration',
                    contentBody: '3 days (06-Dec-19 - 08-Dec-19)',
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  TimeOffDetailsItem(
                    label: 'Request Message',
                    isRequired: true,
                    contentBody: 'Approved by John Smith. Covered by Jane Doe.',
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  TimeOffDetailsItem(
                    label: 'Submitted On',
                    contentBody: '28-Mar-23',
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE7EAEC))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE7EAEC))),
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          label: Text(
                            'Enter Comment',
                            style: TextStyle(
                              color: Color(0xff676A6C),
                              fontSize: 16,
                            ),
                          ),
                          filled: true),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: MaterialButton(
                  height: 50,
                  onPressed: () {},
                  color: const Color(0xff6E789A),
                  child: const Text(
                    'DENY',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )),
                Expanded(
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {},
                    color: const Color(0xff14CB43),
                    child: const Text(
                      'APPROVE',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
