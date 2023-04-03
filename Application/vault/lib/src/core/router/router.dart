import 'package:flutter/material.dart';
import 'package:vault/src/modules/dashboard/dashboard_view.dart';

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
            TabNavigatorRoutes.itemDetails: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Details'),
                    backgroundColor: Colors.orangeAccent,
                  ),
                ),
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
            child: Text('Go To Details')),
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
