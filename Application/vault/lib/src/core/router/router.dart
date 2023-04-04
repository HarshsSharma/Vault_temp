import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vault/src/core/components/side_nav_bar.dart';

import '../components/persistent_nav_bar/item_model.dart';
import '../components/persistent_nav_bar/persistent_nav_bar.dart';
import '../helper/enums/tab_item.dart';
import 'bottom_navigator.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        // return MaterialPageRoute(builder: (context) => const DashBoard());
        return MaterialPageRoute(
          builder: (_) => App(
              navModel: NavModel({
            TabNavigatorRoutes.itemDetails: (context) => const DetailsPage(),
          }, [
            ItemModel(
                GlobalKey<NavigatorState>(), Icons.home, Home(), TabItem.home),
            ItemModel(GlobalKey<NavigatorState>(), Icons.search, Search(),
                TabItem.search),
            ItemModel(GlobalKey<NavigatorState>(), Icons.settings, Settings(),
                TabItem.settings),
            ItemModel(GlobalKey<NavigatorState>(), Icons.person, Profile(),
                TabItem.profile),
          ])),
        );
      default:
        return null;
    }
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        title: const Text('Details'),
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
      ),
      endDrawer: SideNavBar(items: [
        Item(label: 'Dashboard', icon: Icons.dashboard),
        Item(label: 'Time Tracking', icon: Icons.access_time_rounded),
        Item(label: 'Absences', icon: Icons.highlight_off_outlined),
        Item(label: 'Desicion Center', icon: Icons.calendar_today_outlined),
        Item(label: 'Business Trip', icon: Icons.airplanemode_active_rounded),
        Item(label: 'Profile', icon: Icons.person),
        Item(label: 'Logout', icon: Icons.logout),
      ], name: 'Ali Hassan', job: 'Mobile Developer'),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, TabNavigatorRoutes.itemDetails);
            },
            child: const Text('Go To Details')),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, TabNavigatorRoutes.itemDetails);
            },
            child: Text('Go To Details')),
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, TabNavigatorRoutes.itemDetails);
            },
            child: Text('Go To Details')),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, TabNavigatorRoutes.itemDetails);
            },
            child: Text('Go To Details')),
      ),
    );
  }
}

//Custom Page route transition
class FadeRoute extends PageRouteBuilder {
  final Widget page;
  final int milliseconds;
  FadeRoute({
    required this.page,
    this.milliseconds = 1000,
  }) : super(
          transitionDuration: Duration(milliseconds: milliseconds),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  final Offset offset;
  SlideRightRoute({required this.page, this.offset = const Offset(-1, 0)})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: offset,
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
