import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friggly/loginflow/Signupscreen.dart';
import 'package:phone_state_background/phone_state_background.dart';

import 'Home/MainHomeScreen.dart';
import 'app_preferences.dart';
import 'loginflow/splashscreen.dart';
import 'onboardingScreen.dart';




/// Be sure to annotate @pragma('vm:entry-point') your callback function to avoid issues in release mode on Flutter >= 3.3.0

/// Defines a callback that will handle all background incoming events





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
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
   // MyVariables(context: context);
    //YYDialog.init(context);
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

