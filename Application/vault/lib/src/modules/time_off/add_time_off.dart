import 'package:flutter/material.dart';

class AddTimeOff extends StatelessWidget {
  const AddTimeOff({super.key});

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
        title: const Text('Time Off Request'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: DropdownButtonFormField(
                dropdownColor: Colors.white,
                value: null,
                hint: Row(
                  children: const [
                    Text(
                      'Type',
                      style: TextStyle(
                        color: Color(0xff676A6C),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ],
                ),
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text('Holiday (5.5 days)'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text('Holiday (5.5 days)'),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text('Holiday (5.5 days)'),
                  ),
                ],
                onChanged: (value) {},
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffE7EAEC))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffE7EAEC))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: DropdownButtonFormField(
                dropdownColor: Colors.white,
                value: null,
                hint: Row(
                  children: const [
                    Text(
                      'Day Part',
                      style: TextStyle(
                        color: Color(0xff676A6C),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ],
                ),
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text('Holiday (5.5 days)'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text('Holiday (5.5 days)'),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text('Holiday (5.5 days)'),
                  ),
                ],
                onChanged: (value) {},
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffE7EAEC))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffE7EAEC))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE7EAEC))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE7EAEC))),
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    label: Row(
                      children: const [
                        Text(
                          'Date',
                          style: TextStyle(
                            color: Color(0xff676A6C),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ],
                    ),
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE7EAEC))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE7EAEC))),
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    label: Row(
                      children: const [
                        Text(
                          'Request Message',
                          style: TextStyle(
                            color: Color(0xff676A6C),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ],
                    ),
                    filled: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
