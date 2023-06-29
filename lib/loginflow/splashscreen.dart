import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friggly/Home/MainHomeScreen.dart';
import 'package:friggly/app_preferences.dart';
import 'package:phone_state_background/phone_state_background.dart';

import '../main.dart';
import '../onboardingScreen.dart';
import 'mobilenumber.dart';

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
      //CustomDialog.YYNoticeDialog();
      EasyLoading.show(
          dismissOnTap: true,
          indicator: Container(child: Column(children: [
            Text("data",style: TextStyle(color: Colors.red),),
            Text("data",style: TextStyle(color: Colors.grey),),
            Text("data",style: TextStyle(color: Colors.white70),),
          ],)));
      Fluttertoast.showToast(
          msg: 'Incoming call start, number: $number',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 110,
          textColor: Colors.white70,
          fontSize: 16.0
      );
      log('Incoming call start, number: $number, duration: $duration s');


      break;
    case PhoneStateBackgroundEvent.incomingmissed:
      EasyLoading.show(
          dismissOnTap: true,
          indicator: Container(child: Column(children: [
            Text("data",style: TextStyle(color: Colors.red),),
            Text("data",style: TextStyle(color: Colors.grey),),
            Text("data",style: TextStyle(color: Colors.white70),),
          ],)));
      Fluttertoast.showToast(
          msg: 'Incoming call missed, number: $number',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 4,
          textColor: Colors.white70,
          fontSize: 16.0
      );
      log('Incoming call missed, number: $number, duration: $duration s');

      break;
    case PhoneStateBackgroundEvent.incomingreceived:
      EasyLoading.show(
          dismissOnTap: true,
          indicator: Container(child: Column(children: [
            Text("data",style: TextStyle(color: Colors.red),),
            Text("data",style: TextStyle(color: Colors.grey),),
            Text("data",style: TextStyle(color: Colors.white70),),
          ],)));
      Fluttertoast.showToast(
          msg: 'Incoming call received, number: $number, duration: $duration s',
          toastLength: Toast.LENGTH_SHORT,
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
      EasyLoading.show(
          dismissOnTap: true,
          indicator: Container(child: Column(children: [
            Text("data",style: TextStyle(color: Colors.red),),
            Text("data",style: TextStyle(color: Colors.grey),),
            Text("data",style: TextStyle(color: Colors.white70),),
          ],)));
      Fluttertoast.showToast(
          msg: 'Incoming call ended, number: $number, duration: $duration s',
          toastLength: Toast.LENGTH_SHORT,
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
          toastLength: Toast.LENGTH_SHORT,
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
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 100,
          textColor: Colors.red,
          fontSize: 16.0
      );
      log('Outgoing call ended, number: $number, duration: $duration s');
      break;
  }
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver {
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
    _init();
    _navigateToMainScreen();

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

  Future<void> _stop() async {
    await PhoneStateBackground.stopPhoneStateBackground();
  }

  Future<void> _init() async {
    if (hasPermission != true) return;
    if(hasPermission ){
      await PhoneStateBackground.initialize(phoneStateBackgroundCallbackHandler);
    }

  }
  void _navigateToMainScreen() async {
    await Future.delayed(Duration(seconds: 5));

    if(AppPreferences.getShowOnBoarding()){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboardingscreen()),
      );
    }else if(AppPreferences.getToken() != ''){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(id: '', token: '', mobile: '',)),
      );
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Myphone()),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/splash.jpg"),
                  fit: BoxFit.cover,
                )),
         /*   child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () => _init(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Background color
                      ),
                      child: const Text('Start Listener'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () => _stop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Background color
                    ),
                    child: const Text('Stop Listener'),
                  ),
                ),
              ],
            ),*/
          )
    );
  }
}

class CustomDialog {
  static YYDialog YYNoticeDialog() {
    return YYDialog().build()
      ..width = 120
      ..height = 110
      ..backgroundColor = Colors.black.withOpacity(0.8)
      ..borderRadius = 10.0
      ..showCallBack = () {
        print("showCallBack invoke");
      }
      ..dismissCallBack = () {
        print("dismissCallBack invoke");
      }
      ..widget(Padding(
        padding: EdgeInsets.only(top: 21),
        child: Image.asset(
          'images/success.png',
          width: 38,
          height: 38,
        ),
      ))
      ..widget(Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          "Success",
          style: TextStyle(
            fontSize: 15,
            color: Colors.red,
          ),
        ),
      ))
      ..animatedFunc = (child, animation) {
        return ScaleTransition(
          child: child,
          scale: Tween(begin: 0.0, end: 1.0).animate(animation),
        );
      }
      ..show();
  }
}


