import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../API_COLLECTION.dart';
import '../Home/MainHomeScreen.dart';
import '../app_preferences.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/src/form_data.dart' as dioFormData;

//import 'package:shared_preferences/shared_preferences.dart';
//import '../../Utils/app_preferences.dart';
//import 'SignIn.dart';
//import '../homescreen.dart';
class signupscreen extends StatefulWidget {
  final String? token,mobile;
  const signupscreen({Key? key, required this.token, required this.mobile}) : super(key: key);

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {


  late String countryValue;
  late String stateValue;
  late String cityValue;
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


  var _email = '';
  var _password = '';
  var _confirmPassword = '';




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
    print("latest token>>>>"" ${widget.token}");
    print("Govind Email"+" ${emailController.text.toString()}");
    print("Govind name"+" ${nameController.text}");
    print("Govind Dob"+" ${dateInputController.text}");
    print("token iddd ${AppPreferences.getToken()}");
    return SafeArea(
      child: Scaffold(
          body:
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(left: 16,right: 16,top: 40,),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [

                    Text("Sign Up",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),),

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

//Email ID  Field
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                       controller: emailController,
                      // onChanged: (value) {
                      //   _email = value;
                      // },
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                        labelText: "Email ID",
                      //  errorText: _validate ? 'Value Can\'t Be Empty' : null,

                        filled: true, // Needed for adding a fill color
                        //fillColor: Colors.grey.shade800,
                        isDense: true,  // Reduces height a bit
                        border: OutlineInputBorder(
                          // borderSide: BorderSide.none,              // No border
                          borderRadius: BorderRadius.circular(12),  // Apply corner radius
                        ),
                        prefixIcon: Icon(Icons.email, size: 24),
                      ),
                    ),
                    SizedBox(height: 10,),
//Name field
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please  enter name ';
                        }
                        return null;
                      },
                       controller: nameController,
                      // onChanged: (value) {
                      //   _email = value;
                      // },
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                        labelText: "Name",
                       // errorText: _validate ? 'Value Can\'t Be Empty' : null,
                        filled: true, // Needed for adding a fill color
                        //fillColor: Colors.grey.shade800,
                        isDense: true,  // Reduces height a bit
                        border: OutlineInputBorder(
                          // borderSide: BorderSide.none,              // No border
                          borderRadius: BorderRadius.circular(12),  // Apply corner radius
                        ),
                        prefixIcon: Icon(Icons.person, size: 24),
                      ),
                    ),

                    SizedBox(height: 10,),


//Gender Option
                    Container(
                      height:60,
                      decoration: BoxDecoration(
                        //color: Colors.cyan,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12)
                      ),

                      child: GenderPickerWithImage(
                        showOtherGender: false,
                        verticalAlignedText: false,
                        selectedGender: Gender.Male,
                        selectedGenderTextStyle: TextStyle(
                            color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
                        unSelectedGenderTextStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal),
                        onChanged: (Gender? gender) {
                          print(gender);
                        },
                        equallyAligned: true,
                        animationDuration: Duration(milliseconds: 300),
                        isCircular: true,
                        // default : true,
                        opacityOfGradient: 0.4,
                        padding: const EdgeInsets.all(3),
                        size: 50, //default : 40
                      ),
                    ),
                    SizedBox(height: 10,),

//DOB
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select D.O.B';
                        }
                        return null;
                      },
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 3, color: Colors.greenAccent), //<-- SEE HERE
                        ),
                        // border: InputBorder.none,
                        //label: "DOB",
                        labelText: "DOB",
                        hintText: 'DOB',
                        prefixIcon: Icon(Icons.calendar_month,color: Colors.black,),

                      ),
                      controller: dateInputController,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2050));

                        if (pickedDate != null) {
                          dateInputController.text =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                        }
                      },
                    ),


                    SizedBox(height: 10,),


//sign up button
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
                           // Fluttertoast.showToast(msg: "User registered successfully");

                            //signupp(nameController.text.toString(),emailController.text.toString(),dateInputController.text,pickedpic?.path ?? "");
                            signUp(nameController.text.toString(),emailController.text.toString(),dateInputController.text.toString(),pickedImage?.path ?? "",widget.token.toString());



                            // if (_formKey.currentState!.validate()) {
                            //   // If the form is valid, display a snackbar. In the real world,
                            //   // you'd often call a server or save the information in a database.
                            //   // ScaffoldMessenger.of(context).showSnackBar(
                            //   //   const SnackBar(content: Text('Processing Data')),
                            //   // );
                            //   showVerificationDialog(context);
                            // }


                            // setState(() {
                            //   emailController.text.isEmpty ? _validate = true : _validate = false;
                            // });

                            //  login(nameController.text.toString(),phoneController.text.toString(),emailController.text.toString(), passwordController.text.toString());


                           // showVerificationDialog(context);

                          },
                          child:  Text("Sign Up",style: TextStyle(color: Colors.black),)
                      ),
                    ),


                  ],
                ),
              ),
            ),
          )
      ),
    );
  }





  Future<void> signUp(
      String name,
      String email,
      String date,
      String image,
      String token,
      ) async {
    try {
      dio.Dio dioInstance = dio.Dio();
      var headers = {
        //'Authorization': 'Bearer ${AppPreferences.getToken()}'
        //'Authorization': 'Bearer 313|HJSyeBC9lESl2drJwHu3UaP4gL4AsJwkT44mlNT4'
        'Authorization': 'Bearer $token',
        //'Authorization': token
      };
      var formData = dioFormData.FormData.fromMap({
        'name': name,
        'email': email,
        'dob': date,
        'gender': 'Male',
        'image': await dio.MultipartFile.fromFile(image),
      });

      var response = await dioInstance.post(SIGN_UP_URL,
        data: formData,
        options: dio.Options(headers: headers),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        print("govind registered data >>>>>>>>${data}");
        try {

          Dio _dio = Dio();
          Options options = Options(
            headers: {
              'Authorization': 'Bearer ${token}',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          );
          Response response = await _dio.get(GET_PROFILE_URL, options: options);
          print("dio respose with id ${response}");

          if(response.data['status']=='201'){
            AppPreferences.saveCredentials(
                id: response.data['profile']['id'].toString(), token: token, phoneNumber:response.data['profile']['mobileNo']);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                  id: data['userData']['id'].toString(),
                  token: token,
                  mobile: data['userData']['mobileNo'],
                ),
              ),
            );
          }else{
            Fluttertoast.showToast(msg: "unable to get user profile");

          }

        } on DioError catch (e) {
          print(e.response?.statusCode);

          print(e.toString());
          if (e.response?.statusCode == 404) {
            print(e.response?.statusCode);
          } else {
            print(e.message);
            //print(e.request);
          }
        }


        print("govind >>>>>>>>>>${data}");
        Fluttertoast.showToast(msg: "registered");
        AppPreferences.saveCredentials(
          id: data['userData']['id'],
          token: data['token'],
          phoneNumber: data['userData']['mobileNo'],
        );
      } else {
        print("Govind Email: $email");
        print("Govind Name: $name");
        print("Govind Dob: $date");

        print(response.statusMessage);
        print(response.data);
        Fluttertoast.showToast(msg: "failed");
      }
    } catch (error) {
      print(error.toString());
      Fluttertoast.showToast(msg: "An error occurred");
    }
  }

}


