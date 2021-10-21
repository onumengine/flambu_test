import 'package:flambu_test/features/dogs/presentation/ui/fragments/breeds_list_fragment.dart';
import 'package:flambu_test/features/dogs/presentation/ui/fragments/dog_pic_fragment.dart';
import 'package:flambu_test/features/dogs/presentation/ui/fragments/more_fragment.dart';
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
    _fragments = <Widget>[
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
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Dogs',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            label: 'Pic',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'More',
          ),
        ],
        onTap: (indexOfTappedItem) {
          _currentFragmentIndex = indexOfTappedItem;
          setState(() {

          });
        },
      ),
    );
  }
}