import 'package:flutter/material.dart';

class aboutscreen extends StatefulWidget {
  const aboutscreen({Key? key}) : super(key: key);

  @override
  State<aboutscreen> createState() => _aboutscreenState();
}

class _aboutscreenState extends State<aboutscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg1.jpg"),
              fit: BoxFit.cover,
            )),
        child: Column(
          children: [


    ],),
      ),));
  }
}
