
import 'package:flutter/material.dart';
import 'package:friggly/rate&rafer/referscreen.dart';
class refer extends StatefulWidget {
  const refer({Key? key}) : super(key: key);

  @override
  State<refer> createState() => _referState();
}

class _referState extends State<refer> {
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
              Text("REFER",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 45,color: Color(0xffffffff)),),
              //Text("Earn ₹10 per refer",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 28,color: Color(0xffffffff)),),

            ],),
            height: 200,
            width: double.infinity,
            //color: Colors.lightGreen,
          ),

          Container(
            padding: EdgeInsets.only(top: 65,bottom: 10,left: 16,right: 16),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/refer.jpg"),
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
                  Text("Referrals code",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,),),
                  SizedBox(height: 10,),
                  Text("AT5RGFT6CC",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Color(0xff36BBA6)),),
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
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  ReferandEarnScreen()));
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
