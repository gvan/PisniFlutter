import 'package:flutter/material.dart';
import 'package:pisni/ui/navigation/authors_navigation.dart';
import 'package:pisni/ui/navigation/home_navigation.dart';

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
    NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorite')
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: onItemTapped,
        selectedIndex: selectedIndex,
        destinations: bottomDestinations,
        indicatorColor: Colors.blue,
      ),
      body: [
        HomeNavigation(),
        AuthorsNavigation(),
        Text('Screen 3')
      ][selectedIndex],
    );
  }
}
