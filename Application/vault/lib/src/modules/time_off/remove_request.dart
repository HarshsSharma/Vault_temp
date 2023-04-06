import 'package:flutter/material.dart';

class RemoveRequest extends StatelessWidget {
  const RemoveRequest({super.key});

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
        title: const Text('Remove Request'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
                    'Enter Reason For Removing Time Off',
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
    );
  }
}
