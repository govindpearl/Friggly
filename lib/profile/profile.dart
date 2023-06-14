import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:friggly/app_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../API_COLLECTION.dart';
import '../Settingscreen.dart';

class userpost extends StatefulWidget {
  const userpost({Key? key}) : super(key: key);

  @override
  State<userpost> createState() => _userpostState();
}

class _userpostState extends State<userpost> {
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


  Future updateprofile(userstatus,image)async{
    try{

      var headers = {
        'Authorization': 'Bearer 230|d9ZF6x2U5kZ0UGgpRsQniWZLH3d2FOfyzU3kAPDv'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://test.pearl-developer.com/mdk/public/api/add-post'));
      request.fields.addAll({
        'image_ext': 'png',
        'text': userstatus
      });
      request.files.add(await http.MultipartFile.fromPath('image',image));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("api statussss...govind"+await response.stream.bytesToString());
      }
      else {
        print("update status......."+response.reasonPhrase.toString());
        print("failedddd");
      }

    }
    catch(e){
      print(e);
    }
  }


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

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/profilebg.png"),
                    fit: BoxFit.cover,
                  )),
              padding:  EdgeInsets.all(15.0),
              child: Stack(children: [
                Positioned(
                    right:1,
                    child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Settingscreen()));
                        },
                        child: Icon(Icons.settings,size: 30,))),
                SizedBox(
                  height:150,
                  width: 150,
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
                  bottom: 18,
        right: 180,
        child: InkWell(
          onTap: imagePickerOption,
          child: Icon(Icons.camera_alt,color: Color(0xff45C8A6),size: 30,),
        ),
    ),

              ],),
            ),

            Container(
              color: Colors.white,
              height: 60,
              child: Row(
                children: [
                  Text("     ZOHN DOE"),
                 RatingBar.builder(
          initialRating: 3,
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
          },
        ),
                Spacer(),
                  FlutterSwitch(
                    width: 85.0,
                    height: 40.0,
                    valueFontSize: 25.0,
                    toggleSize: 45.0,
                    value: status,
                    borderRadius: 30.0,
                    padding: 7.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    },
                  ),
SizedBox(width: 8,),
                ],
              ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 18,right: 18,top: 16),
                height: double.infinity,
                width: double.infinity,
                //color: Colors.lightGreen,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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

                             // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Rateandrafer()));
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

  getprofile ()async{

    var headers = {
      //'Authorization': 'Bearer 231|ZkFaSlU3awK2ZvDaNONWGnG450cgvKQAL7lajvpn'
      'Authorization': 'Bearer ${AppPreferences.getToken()}'
    };
    var request = http.Request('GET', Uri.parse(GET_PROFILE_URL));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }



}







