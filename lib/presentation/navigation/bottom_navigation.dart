import 'package:flutter/material.dart';
import 'package:pisni/presentation/extensions/localization.dart';
import 'package:pisni/presentation/navigation/authors_navigation.dart';
import 'package:pisni/presentation/navigation/other_navigation.dart';
import 'package:pisni/presentation/navigation/home_navigation.dart';
import 'package:pisni/presentation/navigation/search_navigation.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
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
    navigatorKeys =
        List<GlobalKey<NavigatorState>>.generate(4, (int index) => GlobalKey())
            .toList();
    destinationWidgets = [
      HomeNavigation(navigatorKey: navigatorKeys[0]),
      AuthorsNavigation(navigatorKey: navigatorKeys[1]),
      SearchNavigation(navigatorKey: navigatorKeys[2]),
      OtherNavigation(navigatorKey: navigatorKeys[3]),
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
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.home), label: context.loc.home),
              NavigationDestination(
                  icon: Icon(Icons.face), label: context.loc.authors),
              NavigationDestination(
                  icon: Icon(Icons.search), label: context.loc.search),
              NavigationDestination(
                  icon: Icon(Icons.menu), label: context.loc.other)
            ],
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
