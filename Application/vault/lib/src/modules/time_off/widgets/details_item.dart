import 'package:flutter/material.dart';

class TimeOffDetailsItem extends StatelessWidget {
  final String label;
  final Widget? content;
  final String? contentBody;
  final bool isRequired;
  final TextStyle? textStyle;
  const TimeOffDetailsItem(
      {super.key,
      required this.label,
      this.content,
      this.contentBody,
      this.isRequired = false,
      this.textStyle})
      : assert(
          content == null || contentBody == null,
          'Cannot provide both a content and a contentBody',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: Color(0xffE3E3E3),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                    color: Color(0xff676A6C),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              if (isRequired)
                const Text(
                  ' *',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
            ],
          ),
          const SizedBox(height: 10),
          if (content != null) content!,
          if (contentBody != null)
            Text(
              contentBody!,
              style: textStyle,
            )
        ],
      ),
    );
  }
}
