
import 'package:flutter/material.dart';
import 'package:friggly/rate&rafer/referscreen.dart';
class Rating_Review extends StatefulWidget {
  const Rating_Review({Key? key}) : super(key: key);

  @override
  State<Rating_Review> createState() => _Rating_ReviewState();
}

class _Rating_ReviewState extends State<Rating_Review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5,bottom: 10,left: 16,right: 16),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg2.jpg"),
                  fit: BoxFit.cover,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("John Doe"),
                    Text("9878678876"),
                  ],),
                ClipRRect(
                    borderRadius: BorderRadius.circular(110),
                    child: Image.asset("assets/mic.jpg",height: 120,width: 120,)),
                //Text("Earn ₹10 per refer",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 28,color: Color(0xffffffff)),),

              ],),
            height: 200,
            width: double.infinity,
            //color: Colors.lightGreen,
          ),

          Text("data"),

          Container(child: Column(children: [
            Text("Rating"),
          ],),),


        ],
      ),
    ),);

  }
}
