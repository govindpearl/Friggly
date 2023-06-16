import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class messagescreen extends StatefulWidget {
  const messagescreen({super.key});

  @override
  State<messagescreen> createState() => _messagescreenState();
}

class _messagescreenState extends State<messagescreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.transparent
          ),
          title: const Text('', style: TextStyle(
              color: Colors.white
          )),
          backgroundColor: Colors.greenAccent,
        ),
        body: Container(
          height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/frigglybg2.jpg"),
    fit: BoxFit.cover,
    )),

        ),
      ),
    );
  }
}
