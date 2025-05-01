import 'package:flutter/material.dart';
import 'package:pisni/ui/navigation/authors_navigation.dart';
import 'package:pisni/ui/navigation/favorite_navigation.dart';
import 'package:pisni/ui/navigation/home_navigation.dart';
import 'package:pisni/ui/navigation/search_navigation.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  static const bottomDestinations = [
    NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    NavigationDestination(icon: Icon(Icons.face), label: 'Author'),
    NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
    NavigationDestination(icon: Icon(Icons.star), label: 'Favorite')
  ];
  late final List<GlobalKey<NavigatorState>> navigatorKeys;
  late final List<Widget> destinationWidgets;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
        bottomDestinations.length, (int index) => GlobalKey()).toList();
    destinationWidgets = [
      HomeNavigation(
        navigatorKey: navigatorKeys[0],
      ),
      AuthorsNavigation(
        navigatorKey: navigatorKeys[1],
      ),
      SearchNavigation(navigatorKey: navigatorKeys[2]),
      FavoriteNavigation(navigatorKey: navigatorKeys[3]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return NavigatorPopHandler(
        onPopWithResult: (_) {
          final navigator = navigatorKeys[selectedIndex].currentState!;
          navigator.pop();
        },
        child: Scaffold(
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: onItemTapped,
            selectedIndex: selectedIndex,
            destinations: bottomDestinations,
            indicatorColor: Colors.blue,
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
            top: false,
            child: Builder(builder: (context) {
              return Stack(
                fit: StackFit.expand,
                children: destinationWidgets
                    .asMap()
                    .map((index, view) {
                      if (index == selectedIndex) {
                        return MapEntry(
                            index, Offstage(offstage: false, child: view));
                      } else {
                        return MapEntry(index, Offstage(child: view));
                      }
                    })
                    .values
                    .toList(),
              );
            }),
          ),
        ));
  }
}
