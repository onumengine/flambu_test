import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> _fragments;
  late int _currentFragmentIndex;

  @override
  void initState() {
    super.initState();
    _fragments = <Widget>[];
    _currentFragmentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fragments[_currentFragmentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Dogs',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            label: 'Dogs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'Dogs',
          ),
        ],
        onTap: (indexOfTappedItem) {
          _currentFragmentIndex = indexOfTappedItem;
        },
      ),
    );
  }
}