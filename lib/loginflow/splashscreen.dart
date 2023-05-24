import 'package:flutter/material.dart';
import 'package:friggly/Home/MainHomeScreen.dart';
import 'package:friggly/app_preferences.dart';

import '../onboardingScreen.dart';
import 'mobilenumber.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
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
        MaterialPageRoute(builder: (context) => HomeScreen()),
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
          )
    );
  }
}


