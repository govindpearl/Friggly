
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../app_preferences.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  TextEditingController email_controller = TextEditingController();
  late TextEditingController phone_controller;
  TextEditingController displayName_controller = TextEditingController();
  late TextEditingController country_controller;
  late TextEditingController gender_controller;
  //late TextEditingController username_controller = TextEditingController(text: '');

  //late ScrollPhysics scrollViewScrollabe;
  late ScrollPhysics listViewScrollable;
  bool isEnabled = false;


  @override
  void initState() {
    phone_controller = TextEditingController(text: '+91 999 888 7654');
    country_controller = TextEditingController(text: 'India');
    gender_controller = TextEditingController(text: 'Male');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //FullScreen.setColor(navigationBarColor: Colors.amber, statusBarColor: Colors.amber);


    return Scaffold(
        //backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.transparent, //<-- SEE HERE

          elevation: 0,
          title: Text("Edit Profile", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20, letterSpacing: 2),),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,),
          ),
          //title: Text('Profile', style: TextStyle(color: Colors.black),),
        /*  actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
              child: Container(
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4.0))
                ),
                child: Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: Image.asset('assets/icons/everywhere_icon.png',)),
              ),
            ),
          ],*/
        ),
        body:Container(
height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/frigglybg.jpg"),
                fit: BoxFit.cover,
              )),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      height: 140.0,
                      width: 140.0,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundImage:
                            NetworkImage('https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-260nw-1714666150.jpg'),
                          ),
                          Visibility(
                            visible: isEnabled,
                            child: Positioned(
                              bottom: 5,
                              right: 5,
                              child: Container(
                                height: 35.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: IconButton(onPressed: () {

                                }, icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.red,
                                  size: 20.0,
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(
                      //height: 360,
                      padding: EdgeInsets.only(top: 8),
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                        color: Colors.white,
                      ),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                         Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: displayName_controller,
                              enabled: isEnabled,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              autofocus: true,
                              decoration: InputDecoration(
                                  disabledBorder: InputBorder.none,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber, width: 2,),
                                  )
                              ),
                              style: TextStyle(color: Colors.black, letterSpacing: 2, fontWeight: FontWeight.bold, fontSize: 20),),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.86,
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [

                                ListTile(
                                  leading: Icon(Icons.mail, color: Colors.amber, size: 30,),
                                  title: TextFormField(
                                    controller: email_controller,
                                    enabled: isEnabled,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.amber, width: 2,),
                                        )
                                    ),
                                    style: TextStyle(color: Colors.black54, letterSpacing: 1, fontWeight: FontWeight.w500, fontSize: 16),
                                  ),
                                ),

                                ListTile(
                                  leading: Icon(Icons.phone, color: Colors.amber, size: 30,),
                                  title: TextFormField(
                                    controller: phone_controller,
                                    enabled: isEnabled,
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.amber, width: 2,),
                                        )
                                    ),
                                    style: TextStyle(color: Colors.black54, letterSpacing: 1, fontWeight: FontWeight.w500, fontSize: 16),
                                  ),
                                ),



                                ListTile(
                                  leading: Icon(Icons.perm_contact_calendar_rounded, color: Colors.amber, size: 30,),
                                  title: TextFormField(
                                    controller: gender_controller,
                                    enabled: isEnabled,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.amber, width: 2,),
                                        )
                                    ),
                                    style: TextStyle(color: Colors.black54, letterSpacing: 1, fontWeight: FontWeight.w500, fontSize: 16),
                                  ),
                                ),



                                ListTile(
                                  leading: Icon(Icons.add_business, color: Colors.amber, size: 30,),
                                  title: TextFormField(
                                    controller: country_controller,
                                    enabled: isEnabled,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.amber, width: 2,),
                                        )
                                    ),
                                    style: TextStyle(color: Colors.black54, letterSpacing: 1, fontWeight: FontWeight.w500, fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: MaterialButton(
                                onPressed: () {
                                  if (isEnabled) {
                                    setState(() {
                                      isEnabled = false;
                                    });
                                  } else {
                                    setState(() {
                                      isEnabled = true;
                                    });
                                  }
                                },
                                color: Colors.orange,
                                child: Text(isEnabled?'Done':'Edit', style: TextStyle(color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.w400, fontSize: 20),)
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: MaterialButton(onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen(newPassword: true),)).then((value) {
                        //   FullScreen.setColor(statusBarColor: Colors.amber, navigationBarColor: Colors.white);
                        // });
                      },
                        child: Container(height: 40,alignment: Alignment.center,width: double.infinity, child: Text('')),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}

