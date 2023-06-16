import 'dart:io';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:dio/dio.dart';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../API_COLLECTION.dart';
import '../ModelClass/Get_info_Model.dart';
import '../Rating_dialog box.dart';
import '../app_preferences.dart';



class Friends_Profile extends StatefulWidget {

  final String? namee,mobile;

  Friends_Profile({Key? key, this.namee,this.mobile}) : super(key: key);

  @override
  State<Friends_Profile> createState() => _Friends_ProfileState();
}

class _Friends_ProfileState extends State<Friends_Profile> {

  bool isExpanded = false;
  late String countryValue;
  late String stateValue;
  late String cityValue;
  late String username="";
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

  _callNumber({required String phone}) async{
    print('Hii'+phone);
    bool? res = await FlutterPhoneDirectCaller.callNumber(phone);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body:
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(left: 16,right: 16,top: 40,),
              child:
              FutureBuilder<GetInfoModel?>(
                  future:  getinfo(),
                  builder: (context, snapshot) {

                    if (snapshot.hasData) {
                      print(snapshot.data!.msg.toString());
                      // String sus= snapshot.data!.contact![0].traits![1]+"${1}";

                      //int extrovertvalue = int.parse(snapshot.data!.contact![0].traits![1].toString()) + int.parse(1.toString());

                      //int sum = int.parse(snapshot.data!.contact![0].traits![4].toString()) + int.parse(1.toString());
                      //result = sum.toString();
                      //print("traits  ${sum.toString()}");
                     username= snapshot.data!.contact!.contactName.toString();

                      return Column(
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
                          // Text("Govind Rajpoot",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),),
                          // Text("${widget.namee}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),),

                          Text(username,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),),





                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      _callNumber(phone:"${widget.mobile}");
                                      print("call");
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        //color: Colors.green,
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      height: 60,
                                      width: 60,
                                      child: Icon(Icons.call,color: Colors.green,size: 28,),
                                    ),
                                  ),
                                  Text("Call",style:TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),)
                                ],
                              ) ,

                              Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      print("Message");
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        //color: Colors.green,
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      height: 60,
                                      width: 60,
                                      child: Icon(Icons.message,color: Colors.green,size: 28,),
                                    ),
                                  ),
                                  Text("Message",style:TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),)
                                ],
                              ) ,
                              Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      print("block contact");
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        //color: Colors.green,
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      height: 60,
                                      width: 60,
                                      child: Icon(Icons.block,color: Colors.green,size:28,),
                                    ),
                                  ),
                                  Text("Block",style:TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),)
                                ],
                              ) ,

                            ],),



                          SizedBox(height: 10,),
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
                                    Text("${widget.mobile}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.email,color: Color(0xff03B96E),),
                                    SizedBox(width: 10,),
                                    Text("friggly@gmail.com"),
                                  ],
                                ),
                              ],),
                          ),

                          SizedBox(height: 10,),

                          // rating bar

                          // Container(
                          //   color: Colors.white,
                          //   // height: 60,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Row(
                          //         children: [
                          //           Text("Rating",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                          //           RatingBar.builder(
                          //             initialRating: 0,
                          //             minRating: 1,
                          //             direction: Axis.horizontal,
                          //             allowHalfRating: true,
                          //             itemCount: 5,
                          //             itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          //             itemBuilder: (context, _) => Icon(
                          //               Icons.star,
                          //               color: Colors.amber,
                          //             ),
                          //             onRatingUpdate: (rating) {
                          //               print(rating);
                          //               setState(() {
                          //                 rate=rating.toString();
                          //               });
                          //             },
                          //           ),
                          //           Spacer(),
                          //           Text(rate)
                          //
                          //
                          //         ],
                          //       ),
                          //
                          //     ],
                          //   ),
                          // ),

                          //Text(snapshot.data!.contact![1].contactName.toString()),
                          SizedBox(height: 10,),


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
                                      backgroundColor: Colors.grey,
                                      radius: 30,
                                      child: ClipRRect(
                                          borderRadius:BorderRadius.circular(100),
                                          child: Image.asset("assets/qualitiesimages/extrovert.png",height: 120,width: 120,)),
                                    ),

                                    Text(snapshot.data!.contact!.trait![0].toString()),
                                    //Text("2"),
                                    Text("Extrovert"),
                                  ],),
                                  Column(children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 30,
                                      child: ClipRRect(
                                          borderRadius:BorderRadius.circular(100),
                                          child: Image.asset("assets/qualitiesimages/friendly.png",height: 120,width: 120,)),
                                    ),
                                    Text(snapshot.data!.contact!.trait![1].toString()),
                                    Text("Friendly"),
                                  ],),
                                  Column(children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 30,
                                      child: ClipRRect(
                                          borderRadius:BorderRadius.circular(100),
                                          child: Image.asset("assets/qualitiesimages/intelligent.png",height: 120,width: 120,)),
                                    ),
                                    Text(snapshot.data!.contact!.trait![2].toString()),
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
                                      backgroundColor: Colors.grey,
                                      radius: 30,
                                      child: ClipRRect(
                                          borderRadius:BorderRadius.circular(100),
                                          child: Image.asset("assets/qualitiesimages/handsome.png",height: 120,width: 120,)),
                                    ),
                                    Text(snapshot.data!.contact!.trait![3].toString()),
                                    Text("Good Looking"),
                                  ],),
                                  Column(children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 30,
                                      child: ClipRRect(
                                          borderRadius:BorderRadius.circular(100),
                                          child: Image.asset("assets/qualitiesimages/patience.png",height: 120,width: 120,)),
                                    ),
                                    Text(snapshot.data!.contact!.trait![4].toString()),
                                    Text("Patient"),
                                  ],),
                                  Column(children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 30,
                                      child: ClipRRect(

                                          borderRadius:BorderRadius.circular(100),
                                          child: Image.asset("assets/qualitiesimages/trust.png",height: 120,width: 120,)),
                                    ),
                                    Text(snapshot.data!.contact!.trait![5].toString()),
                                    Text("Trustworthy"),
                                  ],),
                                ],
                              ),


                            ],),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                SizedBox(
                                  //height:2,
                                  width: 65,
                                  child: Row(
                                    children: [
                                      Text(snapshot.data!.contact!.rating.toString(),style: TextStyle(fontSize: 18),),
                                      // Text("2.22",style: TextStyle(fontSize: 18),),
                                      Icon(Icons.star,color: Colors.orangeAccent,),
                                    ],
                                  ),
                                ),
                                Text("7 Rating",style: TextStyle(color: Colors.grey),),
                                Text("3 review",style: TextStyle(color: Colors.grey),),
                              ],),

                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 8),
                                    chartRow(context, '5', snapshot.data!.contact.ratingCount[4]),
                                    chartRow(context, '4', snapshot.data!.contact.ratingCount[3]),
                                    chartRow(context, '3', snapshot.data!.contact.ratingCount[2]),
                                    chartRow(context, '2', snapshot.data!.contact.ratingCount[1]),
                                    chartRow(context, '1', snapshot.data!.contact.ratingCount[0]),
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
                          SizedBox(
                            height: 55,
                            width: double.infinity,
                            child:
                            ElevatedButton(

                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all( Color(0xffFEE572)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(17.0),
                                          // side: BorderSide(color: Colors.red)
                                        )
                                    )
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressDialog(mobile:widget.mobile,namee: username.toString(),)));

                                },
                                child:  Text("Rate Now",style: TextStyle(color: Colors.black),)
                            ),
                          ),

                          SizedBox(height: 60,),
                        ],
                      );


                    }
                    else{
                      return
                        CircularProgressIndicator();

                    }

                  }
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






  Future<GetInfoModel?> getinfo() async {

    FormData formData = FormData.fromMap({
      'contact_no': widget.mobile,
    });
    // Create Dio instance

    Dio dio = Dio();

    // Define the headers
    Map<String, String> headers = {
      'Authorization': 'Bearer ${AppPreferences.getToken()}'
      //'Authorization': 'Bearer 272|zOSOR7ks4vioa05Rp8YwM61GTFAIpybBUSiX3WYv',
    };


    // Define the API endpoint
    String url = GET_INFO_URL;

    try {
      // Make the API call
      Response response = await dio.post(url,data: formData, options: Options(headers: headers));

      // Handle the response
      if (response.statusCode == 200) {
        print(" get info..... ");
        print(response.data);
        return GetInfoModel.fromJson(response.data);

        // API call successful
        print(response.data);
      } else {
        // API call failed
        print('API call failed with status code ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors
      print('An error occurred: $error');
    }
  }






}


