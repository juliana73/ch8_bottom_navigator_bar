import 'package:ch8_bottom_navigation_bar/reminders.dart';
import 'package:flutter/material.dart';
import 'birthdays.dart';
import 'grattitude.dart';
import 'reminders.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState () => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> _listPages = [];
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();

    _listPages
      ..add(Birthdays())
      ..add(Gratitude())
      ..add(Reminders());
    _currentPage = Birthdays();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: _currentPage,
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: ('Birthdays'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            label: ('Gratitude'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: ('Reminders'),
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}