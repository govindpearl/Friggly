import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friggly/Home/CallLog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_state_background/phone_state_background.dart';

import '../Leaderboard/leaderboardscreen.dart';
import '../RATE/Gride_View.dart';
import '../app_preferences.dart';
import '../contact/allcontactlist.dart';
import '../premium.dart';
import '../profile/Editprofile.dart';
import '../profile/new_profile_screen.dart';
import '../profile/profile.dart';
import 'MessageScreen.dart';
import 'fetchmessages.dart';



// show pop up incoming call like a trucaller  code started.

/// Be sure to annotate @pragma('vm:entry-point') your callback function to avoid issues in release mode on Flutter >= 3.3.0
@pragma('vm:entry-point')

/// Defines a callback that will handle all background incoming events
Future<void> phoneStateBackgroundCallbackHandler(
    PhoneStateBackgroundEvent event,
    String number,
    int duration,
    ) async {
  switch (event) {
    case PhoneStateBackgroundEvent.incomingstart:
      print(">>>>>>>>>incoming call");


      Fluttertoast.showToast(
          msg: 'Incoming call start, number: $number',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 110,
          textColor: Colors.white70,
          fontSize: 16.0
      );
      log('Incoming call start, number: $number, duration: $duration s');


      break;
    case PhoneStateBackgroundEvent.incomingmissed:
      Fluttertoast.showToast(
          msg: 'Incoming call missed, number: $number',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 4,
          textColor: Colors.white70,
          fontSize: 16.0
      );
      log('Incoming call missed, number: $number, duration: $duration s');

      break;
    case PhoneStateBackgroundEvent.incomingreceived:

      Fluttertoast.showToast(
          msg: 'Incoming call received, number: $number, duration: $duration s',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 4,
          textColor: Colors.white70,
          fontSize: 16.0
      );
      print("call recived.....");

      log('Incoming call received, number: $number, duration: $duration s');

      EasyLoading.showToast("call reci sucessfully");

      print("call recived...>>>");


      break;
    case PhoneStateBackgroundEvent.incomingend:

      Fluttertoast.showToast(
          msg: 'Incoming call ended, number: $number, duration: $duration s',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 100,
          textColor: Colors.red,
          fontSize: 16.0
      );

      log('Incoming call ended, number: $number, duration $duration s');
      Text("call end ");
      break;
    case PhoneStateBackgroundEvent.outgoingstart:

      Fluttertoast.showToast(
          msg: 'Outgoing call start, number: $number, duration: $duration s',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 100,
          textColor: Colors.green,
          fontSize: 16.0
      );

      log('Outgoing call start, number: $number, duration: $duration s');
      break;
    case PhoneStateBackgroundEvent.outgoingend:
      Fluttertoast.showToast(
          msg: 'Outgoing call ended, number: $number, duration: $duration s',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 100,
          textColor: Colors.red,
          fontSize: 16.0
      );
      log('Outgoing call ended, number: $number, duration: $duration s');
      break;
  }
}


// show pop up incoming call like a trucaller  code end.










class HomeScreen extends StatefulWidget {
  final String? id,token,mobile;
  const HomeScreen({Key? key, required this.id, required this.token, required this.mobile}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
// show pop up incoming call like a trucaller  code started.
  bool hasPermission = false;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      await _hasPermission();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _hasPermission();
    _requestPermission();
    _init();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _hasPermission() async {
    final permission = await PhoneStateBackground.checkPermission();
    if (mounted) {
      setState(() => hasPermission = permission);
    }
  }

  Future<void> _requestPermission() async {
    await PhoneStateBackground.requestPermissions();
  }

 /* Future<void> _stop() async {
    await PhoneStateBackground.stopPhoneStateBackground();
  }*/

  Future<void> _init() async {
    if (hasPermission != true) return;
    await PhoneStateBackground.initialize(phoneStateBackgroundCallbackHandler);
  }

// show pop up incoming call like a trucaller  code end.


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

    MyHome(),
    //EditProfilePage(),
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
    print("token iddd ${AppPreferences.getToken()}");
    print("Home screen user iddd ${widget.id}");
    print("Home screen user tokenn ${widget.token}");
    print("Home screen user mobile ${widget.mobile}");
    // print(AppPreferences.saveCredentials(id: id, token: token, phoneNumber: phoneNumber));

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
