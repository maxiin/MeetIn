import 'package:events_app/pages/dashboard.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage() : super();

  @override
  NavigationState createState() => NavigationState();
}

final List<Widget> pages = [
  DashboardPage(),
  DashboardPage(),
  DashboardPage(),
];

class NavigationState extends State<NavigationPage> {
  int _currentIndex = 0;
  Widget _currentPage = DashboardPage();

  changePage(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text('New Events')),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number), title: Text('Confirmed')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile')),
        ],
        currentIndex: _currentIndex,
        onTap: changePage,
      ),
      body: _currentPage,
    );
  }
}
