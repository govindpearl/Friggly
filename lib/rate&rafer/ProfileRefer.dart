import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../loginflow/otpscreen.dart';
import '../rate&rafer/raterafer.dart';


class ProfileRefer extends StatefulWidget {
  const ProfileRefer({Key? key}) : super(key: key);

  @override
  State<ProfileRefer> createState() => _ProfileReferState();
}

class _ProfileReferState extends State<ProfileRefer> {
  File? pickedpic;
  bool status = false;


  void imagePickerOption() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
      ),
      context: context,
      builder: (context) => SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: Container(
            color: Colors.white,
            //height: ht * 0.25,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10,),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        // width: double.infinity,
                        height: 150,
                        decoration: const BoxDecoration(
                            color: Color(0xffECF1F6),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xffECF1F6),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: Offset(4, 4))
                            ]),
                        child: InkWell(
                          onTap: () {
                            pickImage(ImageSource.camera);
                          },
                          child: const Icon(
                            Icons.camera,
                            //color: kPrimaryColor,
                            size: 50,
                          ),
                        ),
                      ),
                      Container(
                        // width: wt * 0.30,
                        // height: ht * 0.20,
                        decoration:  BoxDecoration(
                            color: Color(0xffECF1F6),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xffECF1F6),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: Offset(4, 4))
                            ]),
                        child: InkWell(
                            onTap: () {
                              pickImage(ImageSource.gallery);
                            },
                            child: const Icon(
                              Icons.folder_open,
                              //color: kPrimaryColor,
                              size: 50,
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "OPENCAMERA",
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "OPENFILE",
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo =
      await ImagePicker().pickImage(source: imageType, imageQuality: 20);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedpic = tempImage;
      });
      Navigator.pop(context);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  TextEditingController userstatusController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold (
      resizeToAvoidBottomInset: true,
      body:  Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg1.jpg"),
              fit: BoxFit.cover,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 15.0,top: 15,bottom: 15),
              child: Row(
                children: [
                  Stack(children: [
                    SizedBox(
                      height:110,
                      width: 110,
                      child: ClipRRect(
                        // radius: 70,
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          //onTap: imagePickerOption,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child:
                            pickedpic != null
                                ? Image.file(
                              pickedpic!,
                              //width: 170,
                              //height: 170,
                              fit: BoxFit.cover,
                            )
                                : InkWell(
                              //onTap: imagePickerOption,
                                child: Image.network("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",fit: BoxFit.fill,)

                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 10,
                      right: 1,
                      child: InkWell(
                        onTap: imagePickerOption,
                        child: Icon(Icons.camera_alt,color: Colors.lightBlue,),
                      ),
                    ),

                  ],),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("JOHN DOE",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white),),
                      Text("24",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white),),


                      Row(children: [
                        Text("Profile Visibility",style: TextStyle(fontSize: 20,color: Colors.white),),
                        SizedBox(width: 5,),
                        FlutterSwitch(
                          width: 66.0,
                          height: 28.0,
                          //valueFontSize: 25.0,
                          toggleSize: 28.0,
                          value: status,
                          borderRadius: 30.0,
                          padding: 3.0,
                          //showOnOff: true,
                          onToggle: (val) {
                            setState(() {
                              status = val;
                            });
                          },
                        ),

                      ],)
                  ],)

                ],
              ),
            ),



            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 18,right: 18,top: 16),
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        height: 100,
                        //width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff8F7624),
                          borderRadius: BorderRadius.circular(15),),
                        padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.star,color: Colors.white,),
                                Text("Go Premium",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white),),
                                Icon(Icons.arrow_forward,color: Colors.white,),
                              ],),
                            Text("Unlock Friggly Elite,super and free boost by selecting a premium plan.",style: TextStyle(color: Colors.white,fontSize: 17),),
                          ],),
                      ),
SizedBox(height: 10,),
                      Text("Hobbies and interests",style: TextStyle(fontSize: 20),),
                      SizedBox(height: 10,),

                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.white
                          //hintText: 'Write something about',
                        ),),
                      SizedBox(height: 10,),
                      Text("Personal Information",style: TextStyle(fontSize: 20),),
                      SizedBox(height: 10,),
                      TextField(
                        minLines: 8,maxLines: 10,
                        textInputAction: TextInputAction.newline,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.symmetric(vertical: 60),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.white
                          //hintText: 'Write something about',
                        ),),
                      SizedBox(height: 30,),

                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all( Color(0xffFEE572)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      // side: BorderSide(color: Colors.red)
                                    )
                                )
                            ),
                            onPressed: (){
                              // updateprofile(userstatusController.text,pickedpic!.path);
                              // Fluttertoast.showToast(msg: "New post");
                              //Navigator.pop(context);
                              // Fluttertoast.showToast(msg: "Save data");
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) =>  Rateandrafer()));
                            },
                            child:  Text("GO PREMIUM",style: TextStyle(color: Colors.black),
                            )
                        ),
                      ),



                    ],),
                ),),
            )

          ],
        ),
      ),


    ));
  }
}







