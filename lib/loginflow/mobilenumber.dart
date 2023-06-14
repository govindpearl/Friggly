
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'otpscreen.dart';
class Myphone extends StatefulWidget {
  const Myphone({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<Myphone> createState() => _MyphoneState();
}

class _MyphoneState extends State<Myphone> {
  TextEditingController mobileno = TextEditingController();
  var countryCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
        child:
        Container(
          padding: EdgeInsets.only(top: 50,left: 30,right: 30),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg1.jpg"),
                fit: BoxFit.cover,
              )),
          child: SingleChildScrollView(
            child: Column(children: [

              ClipRRect(
                  borderRadius: BorderRadius.circular(110),
                  child: Image.asset("assets/mic.jpg",height: 120,width: 120,)),
              Text("Welcome to",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,color: Colors.white),),
              Text("Friggly !",style: TextStyle(fontSize: 55,fontWeight: FontWeight.w700,color: Colors.white),),




              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(20),
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

                      Text("Please enter mobile number to continue", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
                      SizedBox(height: 10,),


                      IntlPhoneField(
                        controller: mobileno,

                        decoration: InputDecoration(
                          //labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(),

                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [ FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                          FilteringTextInputFormatter.digitsOnly
                        ],


                        //initialCountryCode: 'IN',
                        onCountryChanged: (country) {
                          countryCode = country.dialCode;
                        },
                        onChanged: (phone) {
                          print(phone.completeNumber);

                        },

                      ),

                      SizedBox(height: 15,),

                      Padding(
                        padding: const EdgeInsets.only(left: 35,right: 35),
                        child:
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
                              onPressed: ()async{
                                //registerdmobile(mobileno.text.toString());



                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber:"${"+"+countryCode+mobileno.text}",
                                  verificationCompleted: (PhoneAuthCredential credential) {
                                    print("verificationCompleted   Govind");

                                  },
                                  verificationFailed: (FirebaseAuthException e) {
                                    print("verificationFailed errorrrrrrr  Govind");
                                  },
                                  codeSent: (String verificationId, int? resendToken) {
                                    Myphone.verify=verificationId;

                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  Otpscreen(mobile:"+${countryCode+mobileno.text}",mobileno: mobileno.text.toString(),)));


                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) =>  Otpscreen(mobile:"+${countryCode+_mobileno.text}",)));

                                  },
                                  codeAutoRetrievalTimeout: (String verificationId) {
                                  },
                                );
                               // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Otpscreen(mobile:"+${countryCode+mobileno.text}",mobileno: mobileno.text.toString(),)));
                                Fluttertoast.showToast(msg: "Sending OTP");

                              },
                              child:  Text("Get OTP",style: TextStyle(color: Colors.white),)
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      Text("By creating your account you agree to our Terms & Conditions and Privacy Policy", textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),

                    ],),
                ),
              )

            ],),
          ),
        )),);
  }


}

