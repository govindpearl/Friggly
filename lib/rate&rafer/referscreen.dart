import 'package:flutter/material.dart';
import 'package:friggly/rate&rafer/refer.dart';

class ReferandEarnScreen extends StatefulWidget {
  const ReferandEarnScreen({Key? key}) : super(key: key);

  @override
  State<ReferandEarnScreen> createState() => _ReferandEarnScreenState();
}

class _ReferandEarnScreenState extends State<ReferandEarnScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 65,bottom: 10,left: 16,right: 16),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg2.jpg"),
                  fit: BoxFit.cover,
                )),
            child: Column(children: [
              Text("Refer and Earn",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 45,color: Color(0xffffffff)),),
      Text("Earn ₹10 per refer",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 28,color: Color(0xffffffff)),),

            ],),
            height: 200,
            width: double.infinity,
            //color: Colors.lightGreen,
          ),

          Container(
            padding: EdgeInsets.only(top: 65,bottom: 10,left: 16,right: 16),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/referearn.jpg"),
                  fit: BoxFit.cover,
                )),
            height: 250,
            width: double.infinity,
            //color: Colors.lightGreen,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(children: [
                Text("Total Referrals",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,),),
                SizedBox(height: 10,),
                Text("20",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Color(0xff36BBA6)),),
              ],),
              Column(children: [
                Text("Referrals Earnings",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,),),
                SizedBox(height: 10,),
                Text("₹200",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Color(0xff36BBA6)),),
              ],)
            ],),
          ),

SizedBox(height: 30,),
          SizedBox(
            height: 50,
            width: 120,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all( Color(0xff0EBEAA)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          // side: BorderSide(color: Colors.red)
                        )
                    )
                ),
                onPressed: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) =>  refer()));
                },
                child:  Row(
                  children: [
                    Icon(Icons.share),
                    Text("Share",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ],
                )
            ),
          ),


        ],
      ),
    ),);
  }
}
