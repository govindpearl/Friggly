import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friggly/loginflow/Signupscreen.dart';
import 'package:phone_state_background/phone_state_background.dart';

import 'Home/MainHomeScreen.dart';
import 'app_preferences.dart';
import 'loginflow/splashscreen.dart';
import 'onboardingScreen.dart';



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
      Fluttertoast.showToast(
          msg: 'Incoming call , number: $number, duration: $duration s',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 100,
          textColor: Colors.grey,
          fontSize: 16.0
      );
      log('Incoming call start, number: $number, duration: $duration s');
      break;
    case PhoneStateBackgroundEvent.incomingmissed:
      Fluttertoast.showToast(
          msg: 'Missed CAll, number: $number, duration: $duration s',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 100,
          textColor: Colors.red,
          fontSize: 16.0
      );
      log('Incoming call missed, number: $number, duration: $duration s');
      break;
    case PhoneStateBackgroundEvent.incomingreceived:
      Fluttertoast.showToast(
          msg: 'Incoming call recived, number: $number, duration: $duration s',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 100,
          textColor: Colors.grey,
          fontSize: 16.0
      );
      log('Call Received, number: $number, duration: $duration s');
      break;
    case PhoneStateBackgroundEvent.incomingend:
      Fluttertoast.showToast(
          msg: 'Call Ended, number: $number, duration: $duration s',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 100,
          textColor: Colors.red,
          fontSize: 16.0
      );
      log('Incoming call ended, number: $number, duration $duration s');
      break;
    case PhoneStateBackgroundEvent.outgoingstart:
      log('Ougoing call start, number: $number, duration: $duration s');
      break;
    case PhoneStateBackgroundEvent.outgoingend:
      log('Ougoing call ended, number: $number, duration: $duration s');
      break;
  }
}




// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(const MyApp());
//
// }


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppPreferences.init();


  //SharedPreferences prefs =await SharedPreferences.getInstance();
  //var phone=prefs.getString("phone");
  //print(phone);
  // runApp(MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //  // home: phone==null?signupscreen():HomeScreen(),
  // ));

  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{

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
    super.initState();
    _init();
    //_requestPermission();
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

  Future<void> _stop() async {
    await PhoneStateBackground.stopPhoneStateBackground();
  }

  Future<void> _init() async {
    if (hasPermission != true) return;
    await PhoneStateBackground.initialize(phoneStateBackgroundCallbackHandler);
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home:  Onboardingscreen(),
      //home:  HomeScreen(),
      //builder: EasyLoading.init(),

      home:  SplashScreen(),

    );
  }
}
