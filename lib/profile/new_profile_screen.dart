import 'dart:io';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';



class Profile_new extends StatefulWidget {
  const Profile_new({Key? key}) : super(key: key);

  @override
  State<Profile_new> createState() => _Profile_newState();
}

class _Profile_newState extends State<Profile_new> {

  bool isExpanded = false;
  late String countryValue;
  late String stateValue;
  late String cityValue;
  String rate="";


  File? pickedImage;
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
        pickedImage = tempImage;
      });
      Navigator.pop(context);
    } catch (error) {
      debugPrint(error.toString());
    }
  }


  TextEditingController emailController =   TextEditingController();
  TextEditingController phoneController =   TextEditingController();
  TextEditingController nameController =   TextEditingController();
  bool _validate = false;
  TextEditingController passwordController =  TextEditingController();
  TextEditingController confirmpasswordController =  TextEditingController();
  TextEditingController dateInputController = TextEditingController();







  final textFieldFocusNode = FocusNode();
  final textFieldFocus = FocusNode();
  bool _obscured = true;
  bool _obscuredq = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

  void _toggleObscuredpassword() {
    setState(() {
      _obscuredq = !_obscuredq;
      if (textFieldFocus.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocus.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(left: 16,right: 16,top: 40,),
              child: Column(
                children: [



                  SizedBox(height: 10,),

                  Stack(children: [
                    CircleAvatar(
                      radius: 70,
                      // borderRadius: BorderRadius.circular(100),
                      child: InkWell(
                        //onTap: imagePickerOption,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child:
                          pickedImage != null
                              ? Image.file(
                            pickedImage!,
                            width: 170,
                            height: 170,
                            fit: BoxFit.cover,
                          )
                              : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              //onTap: imagePickerOption,
                              child: Image.network("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",height: 170,width: 170,fit: BoxFit.fill,)

                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 20,
                      right: 0,
                      child: InkWell(
                        onTap: imagePickerOption,
                        child: Icon(Icons.camera_alt,color: Colors.black,size: 30,),
                      ),
                    ),

                  ],),

                  SizedBox(height: 15,),
                  Text("Govind Rajpoot",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),),

                  Container(
                    padding: EdgeInsets.all(16),
                    //height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffFFF2F2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Row(
                        children: [
                          Icon(Icons.location_on,color: Color(0xff03B96E),),
                          SizedBox(width: 10,),
                          Text("Dehradoon"),
                        ],
                      ),
                        Row(
                          children: [
                            Icon(Icons.phone,color: Color(0xff03B96E),),
                            SizedBox(width: 10,),
                            Text("+919876543210"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.email,color: Color(0xff03B96E),),
                            SizedBox(width: 10,),
                            Text("govind@gmail.com"),
                          ],
                        ),
                    ],),
                  ),

                  SizedBox(height: 20,),

                  Container(
                    color: Colors.white,
                    // height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Rating",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                            RatingBar.builder(
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                                setState(() {
                                  rate=rating.toString();
                                });
                              },
                            ),
                            Spacer(),
                            Text(rate)


                          ],
                        ),

                      ],
                    ),
                  ),


                  SizedBox(height: 20,),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                  borderRadius:BorderRadius.circular(100),
                                  child: Image.asset("assets/extrovert.jpg",height: 120,width: 120,)),
                            ),
                            Text("1"),
                            Text("Extrovert"),
                          ],),
                          Column(children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                  borderRadius:BorderRadius.circular(100),
                                  child: Image.asset("assets/extrovert.jpg",height: 120,width: 120,)),
                            ),
                            Text("1"),
                            Text("Extrovert"),
                          ],),
                          Column(children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                  borderRadius:BorderRadius.circular(100),
                                  child: Image.asset("assets/extrovert.jpg",height: 120,width: 120,)),
                            ),
                            Text("1"),
                            Text("Friendly"),
                          ],),
                          Column(children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                  borderRadius:BorderRadius.circular(100),
                                  child: Image.asset("assets/extrovert.jpg",height: 120,width: 120,)),
                            ),
                            Text("1"),
                            Text("Intelligent"),
                          ],),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                  borderRadius:BorderRadius.circular(100),
                                  child: Image.asset("assets/extrovert.jpg",height: 120,width: 120,)),
                            ),
                            Text("1"),
                            Text("Good Looking"),
                          ],),
                          Column(children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                  borderRadius:BorderRadius.circular(100),
                                  child: Image.asset("assets/extrovert.jpg",height: 120,width: 120,)),
                            ),
                            Text("1"),
                            Text("Patient"),
                          ],),
                          Column(children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                  borderRadius:BorderRadius.circular(100),
                                  child: Image.asset("assets/extrovert.jpg",height: 120,width: 120,)),
                            ),
                            Text("1"),
                            Text("Trustworthy"),
                          ],),
                        ],
                      ),







                    ],),
                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Row(
                          children: [
                            Text("3.5",style: TextStyle(fontSize: 18),),
                            Icon(Icons.star,color: Colors.orangeAccent,),
                          ],
                        ),
                        Text("7 Rating",style: TextStyle(color: Colors.grey),),
                        Text("3 review",style: TextStyle(color: Colors.grey),),
                      ],),

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 8),
                            chartRow(context, '5', 89),
                            chartRow(context, '4', 40),
                            chartRow(context, '3', 30),
                            chartRow(context, '4', 20),
                            chartRow(context, '1', 10),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),

              Container(
                decoration: BoxDecoration(
                    color:Color(0xffFFE6E6),

                    borderRadius: BorderRadius.circular(12)
                ),
                width: double.infinity,
                //height: isExpanded ? null : 300,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reviews",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                    SizedBox(height: 10,),
                    Text(
                      'Truecaller reviews seem mostly positive. As of September 2022, the app has a 4.5-star ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    if (isExpanded)
                      Text(
                        'rating from 251.8K reviews on the App Store. On Google Play, it maintains its 4.5-star rating average with 18.1M reviews',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? 'View less' : 'View more',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),



//sign up button
                SizedBox(height: 20,),


                ],
              ),
            ),
          )
      ),
    );

  }



  Widget chartRow(BuildContext context, String label, int pct) {
    return Row(
      children: [
        Text(label,),
        SizedBox(width: 8),
        Icon(Icons.star,color: Colors.greenAccent,),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
          child:
          Stack(
              children: [
                Container(
                  height:8,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color:Colors.grey,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(''),
                ),
                Container(
                  height:8,
                  width: MediaQuery.of(context).size.width * (pct/100) * 0.5,
                  decoration: BoxDecoration(
                      color:Colors.green,
                      // color: AppTheme.color3,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(''),
                ),
              ]

          ),
        ),
        Text('$pct%'),
      ],
    );
  }

}


