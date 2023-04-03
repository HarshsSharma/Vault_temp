import 'package:flutter/material.dart';
import 'package:vault/src/core/helper/enums/tab_item.dart';

class ItemModel {
  final GlobalKey<NavigatorState> navigatorKey;
  final IconData icon;
  final Widget screen;
  final TabItem tabItem;

  ItemModel(this.navigatorKey, this.icon, this.screen, this.tabItem);
}

class NavModel {
  final Map<String, Widget Function(BuildContext)> routes;
  final List<ItemModel> items;

  NavModel(this.routes, this.items);
}
