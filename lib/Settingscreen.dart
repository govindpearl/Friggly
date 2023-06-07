import 'package:flutter/material.dart';
import 'package:friggly/profile/Editprofile.dart';
import 'package:friggly/yourprivacyscreen.dart';

import 'RATE/Apprating.dart';
import 'app_preferences.dart';
import 'loginflow/mobilenumber.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({Key? key}) : super(key: key);

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child:Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg1.jpg"),
            fit: BoxFit.cover,
          )),
      padding: EdgeInsets.only(left: 16,right: 16,top: 7),
      child: Column(children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,size: 30,)),
          SizedBox(width: 10,),
          Text("Setting",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        ],),
        SizedBox(height: 13,),
        SizedBox(
          height: 50,
          //width: 120,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all( Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.grey)
                      )
                  )
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditProfilePage()));
              },
              child:  Row(
                children: [
                  Icon(Icons.person,color: Colors.green),
                  Text("    Personal information",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w300),),
                ],
              )
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 50,
          //width: 120,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all( Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.grey)
                      )
                  )
              ),
              onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) =>  ReferandEarnScreen()));
              },
              child:  Row(
                children: [
                  Icon(Icons.help_center_outlined,color: Colors.green),
                  Text("    Help-Center",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w300),),
                ],
              )
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 50,
          //width: 120,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all( Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.grey)
                      )
                  )
              ),
              onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) =>  ReferandEarnScreen()));
              },
              child:  Row(
                children: [
                  Icon(Icons.lock,color: Colors.green),
                  Text("    Terms & Condition",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w300),),
                ],
              )
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 50,
          //width: 120,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all( Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.grey)
                      )
                  )
              ),
              onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) =>  ReferandEarnScreen()));
              },
              child:  Row(
                children: [
                  Icon(Icons.lock,color: Colors.green),
                  Text("    Privacy & Policy",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w300),),
                ],
              )
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 50,
          //width: 120,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all( Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                         side: BorderSide(color: Colors.grey)
                      )
                  )
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  apprating()));
              },
              child:  Row(
                children: [
                  Icon(Icons.error_outline,color: Colors.green),
                  Text("    About",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w300),),
                ],
              )
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 50,
          //width: 120,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all( Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.grey)
                      )
                  )
              ),
              onPressed: (){

                AppPreferences.clearCredentials();
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => Myphone()));
              },
              child:  Row(
                children: [
                  Icon(Icons.logout,color: Colors.green),
                  Text("    Logout",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w300),),
                ],
              )
          ),
        ),



      ],),
    ),),);
  }
}
