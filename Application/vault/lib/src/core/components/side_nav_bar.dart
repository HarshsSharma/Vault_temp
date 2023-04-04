import 'dart:ui';

import 'package:flutter/material.dart';

class SideNavBar extends StatefulWidget {
  final List<Item> items;
  final ImageProvider<Object>? image;
  final String name;
  final String job;
  const SideNavBar(
      {super.key,
      required this.items,
      this.image,
      required this.name,
      required this.job});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  int _index = -1;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 50),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: widget.image,
                  radius: 25,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(widget.job),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: Color.fromARGB(255, 160, 159, 159),
            margin: EdgeInsets.symmetric(vertical: 16),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: widget.items
                .map((e) => DrawerItem(
                      icon: e.icon,
                      label: e.label,
                      onTap: () {
                        setState(() {
                          _index = widget.items.indexOf(e);
                        });
                        if (e.onTap != null) {
                          e.onTap!();
                        }
                      },
                      isActive: widget.items.indexOf(e) == _index,
                    ))
                .toList(),
          ))
        ],
      ),
    );
  }
}

class Item {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  Item({required this.label, required this.icon, this.onTap});
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isActive;
  const DrawerItem(
      {super.key,
      required this.icon,
      required this.label,
      this.onTap,
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          border: isActive
              ? Border(left: BorderSide(color: Colors.blue, width: 5))
              : null,
          color: isActive ? Color.fromARGB(255, 175, 211, 239) : Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Color.fromARGB(255, 100, 99, 99),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                  color: Color.fromARGB(255, 100, 99, 99), fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
