import 'package:flutter/material.dart';

class RadioOption extends StatelessWidget {
  final bool isSelected;
  final String title;
  const RadioOption({super.key, required this.isSelected, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey, width: 3),
            ),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.green : Colors.transparent,
              ),
            ),
          ),
          FittedBox(
            child: Text(
              title,
              maxLines: 1,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
