import 'package:flambu_test/features/dogs/presentation/pages/fragments/breeds_list_fragment.dart';
import 'package:flambu_test/features/dogs/presentation/pages/fragments/dog_pic_fragment.dart';
import 'package:flambu_test/features/dogs/presentation/pages/fragments/more_fragment.dart';
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
    _fragments = const <Widget>[
      BreedsListFragment(),
      DogPicFragment(),
      MoreFragment(),
    ];
    _currentFragmentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fragments[_currentFragmentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Dogs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            label: 'Pic',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'More',
          ),
        ],
        onTap: (indexOfTappedItem) {
          setState(() {
            _currentFragmentIndex = indexOfTappedItem;
          });
        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
