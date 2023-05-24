import 'dart:io';
import 'package:flutter/material.dart';
import 'package:friggly/Home/CallLog.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Leaderboard/leaderboardscreen.dart';
import '../RATE/Gride_View.dart';
import '../contact/allcontactlist.dart';
import '../premium.dart';
import '../profile/Editprofile.dart';
import '../profile/new_profile_screen.dart';
import '../profile/profile.dart';
import 'MessageScreen.dart';
import 'fetchmessages.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController _homeController = ScrollController();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    CallLogScreen(),
    SMSFetch(),
   // MessageScreen(),
    Allcontactlist(),
    //Grideview(),
    //Leaderboardscreen(),

   // MyHome(),
    EditProfilePage(),
    Profile_new(),
   // userpost(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    Future<bool> _willPopCallback() async {
      exit(0);
      // await showDialog or Show add banners or whatever
      // then
      return true; // return true if the route to be popped
    }
    return

      WillPopScope(
        // onWillPop: _willPopCallback,

        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title:  Text('Do you want to exit ?'),
                //actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [

                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child:  Text('No'),
                  ),

                  TextButton(
                    onPressed: () {
                      _willPopCallback();
                      // Navigator.pop(context, true);
                    },
                    child:  Text('Yes'),
                  ),
                ],
              );
            },
          );
          return shouldPop!;
        },
        child: SafeArea(child:  Scaffold(

          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),


          bottomNavigationBar: BottomNavigationBar(
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.call),
                  label: 'Calls',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.contacts),
                  label: 'Contacts',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.leaderboard),
                //   label: 'Leaderboard',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.workspace_premium_outlined),
                  label: 'Premium',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),


              ],

              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              unselectedItemColor: Colors.black,
              onTap: (int index) {
                // switch (index) {
                //   case 0:
                //   // only scroll to top when current index is selected.
                //     if (_selectedIndex == index) {
                //       _homeController.animateTo(
                //         0.0,
                //         duration: const Duration(milliseconds: 500),
                //         curve: Curves.easeOut,
                //       );
                //     }
                //     break;
                //   case 1:
                //     showSettingDialog(context);
                //     break;
                // }
                setState(
                      () {
                    _selectedIndex = index;
                  },
                );
              }

          ),
        )),
      );
  }


  showSettingDialog(BuildContext context,) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return showModalBottomSheet<void>(
      backgroundColor: const Color(0xfff1f1f1),
      // context and builder are
      // required properties in this widget+
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
      ),
      context: context,
      builder: (context1) {
        // we set up a container inside which
        // we create center column and display text
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Text(
              "Pick a direct link ",
              style: GoogleFonts.montserrat(
                  fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Container(
              width: width * 0.7,
              height: height * 0.06,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Text(
              "Whe you tap someone phone \n this link will be opened instead of your full profile ",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(),
            ),
          ],
        );
      },
    );
  }
}