import 'package:bigo_task/globals.dart';
import 'package:bigo_task/screens/home.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var currTabIndex = 0;
  List<Widget> _tabViews = [
    Home(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _tabViews[currTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: globals.appMainColor,
        unselectedItemColor: globals.grayColor,
        showSelectedLabels: false,
        iconSize: 28,
        // selectedLabelStyle: TextStyle(color: globals.appMainColor),
        onTap: onTabClick,
        currentIndex: currTabIndex,
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: new Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.date_range), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined), label: 'Notifications')
        ],
      ),
    );
  }

  onTabClick(tabIndex) {
    setState(() => currTabIndex = tabIndex);
  }
}
