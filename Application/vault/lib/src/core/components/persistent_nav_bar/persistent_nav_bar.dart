import 'package:flutter/material.dart';

import '../../helper/enums/tab_item.dart';
import '../../router/bottom_navigator.dart';
import 'item_model.dart';

class App extends StatefulWidget {
  final NavModel navModel;
  const App({super.key, required this.navModel});

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  late TabItem _currentTab;
  @override
  void initState() {
    _currentTab = widget.navModel.items.first.tabItem;
    super.initState();
  }

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      widget.navModel.items
          .firstWhere((element) => element.tabItem == tabItem)
          .navigatorKey
          .currentState!
          .popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab = !await widget.navModel.items
              .firstWhere((element) => element.tabItem == _currentTab)
              .navigatorKey
              .currentState!
              .maybePop();
          if (isFirstRouteInCurrentTab) {
            // if not on the 'main' tab
            if (_currentTab != widget.navModel.items.first.tabItem) {
              // select 'main' tab
              _selectTab(widget.navModel.items.first.tabItem);
              // back button handled by app
              return false;
            }
          }
          // let system handle back button if we're on the first route
          return isFirstRouteInCurrentTab;
        },
        child: Scaffold(
          body: Stack(
              children: widget.navModel.items
                  .map((e) => _buildOffstageNavigator(e.tabItem, e.screen,
                      e.navigatorKey, widget.navModel.routes))
                  .toList()),
          bottomNavigationBar: Container(
            child: Row(
              children: widget.navModel.items
                  .map((e) => Expanded(
                        child: BottomNavItem(
                            isActive: e.tabItem == _currentTab,
                            label: e.label,
                            icon: e.icon,
                            onTap: () {
                              _selectTab(e.tabItem);
                            }),
                      ))
                  .toList(),
            ),
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //     type: BottomNavigationBarType.fixed,
          //     selectedFontSize: 0,
          //     unselectedFontSize: 0,
          //     onTap: (value) {
          //       _selectTab(widget.navModel.items[value].tabItem);
          //     },
          //     currentIndex: _currentTab.index,
          //     selectedItemColor: Colors.amber,
          //     unselectedItemColor: Colors.grey,
          //     items: widget.navModel.items
          //         .map((e) => BottomNavigationBarItem(
          //               icon: Icon(e.icon),
          //               label: '',
          //             ))
        ) //         .toList())),
        );
  }

  Widget _buildOffstageNavigator(
    TabItem tabItem,
    Widget child,
    GlobalKey<NavigatorState> globalKey,
    Map<String, Widget Function(BuildContext)> routes,
  ) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: globalKey,
        mainView: child,
        routes: routes,
      ),
    );
  }
  // Widget _buildOffstageNavigator(TabItem tabItem) {
  //   return Offstage(
  //     offstage: _currentTab != tabItem,
  //     child: TabNavigator(
  //       navigatorKey: _navigatorKeys[tabItem],
  //       tabItem: tabItem,
  //     ),
  //   );
  // }
}

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const BottomNavItem(
      {super.key,
      this.isActive = false,
      required this.label,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
            border: Border(
          top: isActive
              ? BorderSide(color: Colors.blue, width: 3)
              : BorderSide.none,
        )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Color.fromARGB(255, 17, 4, 96) : Colors.grey,
            ),
            const SizedBox(height: 5),
            FittedBox(
              child: Text(
                label,
                style: TextStyle(
                    color:
                        isActive ? Color.fromARGB(255, 17, 4, 96) : Colors.grey,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
