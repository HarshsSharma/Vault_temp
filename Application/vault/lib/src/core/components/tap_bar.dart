import 'package:flutter/material.dart';

import '../helper/extentions/media_query.dart';

class CustomTapBar extends StatefulWidget {
  final List<TabBarItem> children;
  final ValueChanged<int> onChanged;
  const CustomTapBar(
      {super.key, required this.children, required this.onChanged});

  @override
  State<CustomTapBar> createState() => _CustomTapBarState();
}

class _CustomTapBarState extends State<CustomTapBar> {
  int _isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: widget.children
            .map((e) => Expanded(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      _isSelected = widget.children.indexOf(e);
                    });
                    widget.onChanged(widget.children.indexOf(e));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: _isSelected == widget.children.indexOf(e)
                          ? const Color(0xffE5F3FF)
                          : const Color(0x00000033),
                      border: Border(
                        bottom: BorderSide(
                            color: _isSelected == widget.children.indexOf(e)
                                ? const Color(0xff008AFF)
                                : const Color(0xffE3E3E3),
                            width: _isSelected == widget.children.indexOf(e)
                                ? 3
                                : 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          e.label,
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                          style: TextStyle(
                              color: _isSelected == widget.children.indexOf(e)
                                  ? const Color(0xff6E789A)
                                  : const Color(0xff505064),
                              fontSize: 16),
                        ),
                        const SizedBox(width: 8),
                        if (e.count != null)
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _isSelected == widget.children.indexOf(e)
                                    ? const Color(0xff008AFF)
                                    : const Color(0xffE5F3FF)),
                            height: 25,
                            width: 25,
                            child: Text(
                              e.count.toString(),
                              style: TextStyle(
                                  color:
                                      _isSelected == widget.children.indexOf(e)
                                          ? Colors.white
                                          : const Color(0xff6E789A)),
                            ),
                          ),
                      ],
                    ),
                  ),
                )))
            .toList());
  }
}

class TabBarItem {
  final String label;
  final int? count;

  TabBarItem({required this.label, this.count});
}
