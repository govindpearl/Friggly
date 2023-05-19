import 'package:flutter/material.dart';
import 'package:friggly/rate&rafer/ratescreen.dart';
import 'package:friggly/rate&rafer/refer.dart';
import 'package:friggly/rate&rafer/referscreen.dart';

import '../profile/profile.dart';
import 'ProfileRefer.dart';

class Rateandrafer extends StatefulWidget {
  const Rateandrafer({super.key});

  @override
  State<Rateandrafer> createState() => _RateandraferState();
}

class _RateandraferState extends State<Rateandrafer> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    refer(),
    ratescreen(),
    ProfileRefer(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_sharp,size: 30,),
            label: 'Refer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rate,size: 30),
            label: 'Rate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 30,),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:Color(0xff36BBA6),
        onTap: _onItemTapped,
      ),
    );
  }
}
