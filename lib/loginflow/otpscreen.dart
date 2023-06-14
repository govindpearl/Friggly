import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friggly/app_preferences.dart';
import 'package:friggly/loginflow/mobilenumber.dart';
import 'package:http/http.dart' as http;
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pinput/pinput.dart';
import '../API_COLLECTION.dart';
import '../Home/MainHomeScreen.dart';
import '../yourprivacyscreen.dart';


class Otpscreen extends StatefulWidget {
  final String? mobile,mobileno;
  const Otpscreen({Key? key, this.mobile, this.mobileno}) : super(key: key);

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  final FirebaseAuth auth =FirebaseAuth.instance;
  // OtpTimerButtonController controller = OtpTimerButtonController();

  OtpTimerButtonController controller = OtpTimerButtonController();

  _requestOtp() {
    controller.loading();
    Future.delayed(Duration(seconds: 2), () {
      controller.startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    var code="";
    return Scaffold(body: SafeArea(child: Container(
      padding: EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg1.jpg"),
            fit: BoxFit.cover,
          )),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.circular(10)
              ),
              // height: 300,
              //width: 200,
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 10,),

                    Text("Login!", textAlign: TextAlign.center,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700,),),
                    SizedBox(height: 20,),
                    Text("Enter OTP received on", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey),),
                    SizedBox(height: 8,),
                    Text("${widget.mobile}", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey),),
                    SizedBox(height: 30,),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text("OTP", textAlign: TextAlign.left,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey),),
                      ),
                    ),

                    SizedBox(height: 10,),
                    Pinput(
                      length: 6,
                      showCursor: true,
                      onChanged: (value){
                        code=value;
                      },
                    ),

                    /*  OtpTextField(
                      numberOfFields: 6,
                      borderColor: Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String verificationCode) {
                        code=verificationCode;
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) async {

                          // PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId:Myphone.verify, smsCode: code);
                          // await auth.signInWithCredential(credential);

                         // registerdmobile(widget.mobileno);


                         // Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen()));


                        //Navigator.push(context, MaterialPageRoute(builder: (context) =>  PrivacyPage()));

                        // showDialog(
                        //     context: context,
                        //     builder: (context){
                        //       return AlertDialog(
                        //         title: Text("Verification Code"),
                        //         content: Text('Code entered is $verificationCode'),
                        //
                        //       );
                        //     }
                        // );
                      }, // end onSubmit
                    ),*/
                    SizedBox(height: 20,),

                    Text("Code Sent", textAlign: TextAlign.left,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey),),


                    SizedBox(height: 50,),

                    OtpTimerButton(
                      backgroundColor: Color(0xff0EBEAA),
                      controller: controller,
                      onPressed: () => _requestOtp(),
                      text: Text('Resend OTP '),
                      duration: 6,
                    ),



                    // Text("Resend OTP in 00:30", textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 35,right: 35),
                      child: SizedBox(
                        height: 40,
                        width: double.infinity,
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
                            onPressed: ()async{

                              try{
                                PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId:Myphone.verify, smsCode: code);
                                await auth.signInWithCredential(credential);
                                Fluttertoast.showToast(msg: "Correct OTP");
                                registerdmobile(widget.mobileno);
                                // registerdmob
                                // ile(widget.mobileno);
                                // SharedPreferences pref =
                                // await SharedPreferences.getInstance();
                                // pref.setString("phone", "${widget.mobile}");
                                // Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen()));

                              }
                              catch(e){
                                Fluttertoast.showToast(msg: "Wrong OTP");
                                print("wrong otp");
                              }


                              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen()));
                            },
                            child:  Text("Confirm",style: TextStyle(color: Colors.white,fontSize: 20),)
                        ),
                      ),
                    ),


                  ],),
              ),
            )

          ],),
      ),
    ),),);
  }



  registerdmobile(mobile)async{

    var request = http.MultipartRequest('POST', Uri.parse(REGISTRATION_URL));
    request.fields.addAll({
      'mobileNo': mobile
    });

    http.StreamedResponse response = await request.send();
    final String newData = await response.stream.bytesToString();
    final data = jsonDecode(newData);
    //print("user data>>>>>>>>>"+data.toString());
    print("New Data>>>>>>>>> $newData");

    //Fluttertoast.showToast(msg: data.toString());


    if (response.statusCode == 201) {
      print("user data>>>>>>>>> first time"+data.toString());
      //print(data.toString());

      print("user created");
      Fluttertoast.showToast(msg: "user created");
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  PrivacyPage(token: data['api_token'],mobile: widget.mobileno),));
     // Fluttertoast.showToast(msg: "Status code 201");
    }
    else if(response.statusCode == 202){
      print("user data>>>>>>>>> second time "+data.toString());

      //print(data.toString());

      //Fluttertoast.showToast(msg: "Status code 202");

      //AppPreferences.saveCredentials(id: '', token: data['token'], phoneNumber: '');
      Fluttertoast.showToast(msg: "User registered but profile not created");
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  PrivacyPage(token: data['api_token'],mobile: widget.mobileno),));

    }

    else if(response.statusCode == 200) {
      print("user data>>>>>>>>> last time " + data.toString());

      // AppPreferences.saveCredentials(id: data['userdata']['id'].toString(), token: data['token'], phoneNumber: data['userData']['mobileNo'].toString());
      //Fluttertoast.showToast(msg: "User already exist");
      //Fluttertoast.showToast(msg: "Status code 200");
      AppPreferences.saveCredentials(
          id: data['userData']['id'].toString(), token: data['token'], phoneNumber: data['userData']['mobileNo'].toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(id:data['userData']['id'].toString(), token:data['token'], mobile:data['userData']['mobileNo'].toString(),)));



    }
    else {
      Fluttertoast.showToast(msg: "Server problem ");

      print(response.statusCode);
      print("Error: "+await response.stream.bytesToString());

      print("Server error");

    }

  }
}
