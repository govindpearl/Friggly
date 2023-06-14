import 'dart:convert';
import 'package:contacts_service/contacts_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import '../API_COLLECTION.dart';
import '../Leaderboard/leaderboardscreen.dart';
import '../app_preferences.dart';
import '../profile/friends_profile.dart';

class Allcontactlist extends StatelessWidget {
  const Allcontactlist({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return ScreenUtilInit(
      builder: ((context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const contlist(),
        //themeMode: ThemeMode.dark,
        //darkTheme: ThemeData.dark(),
      )),
    );
  }
}

class contlist extends StatefulWidget {
  const contlist({super.key});

  @override
  State<contlist> createState() => _contlistState();
}

class _contlistState extends State<contlist> {
  List<Contact> _contacts = [];
  String allcon ="";

  @override
  void initState() {
    super.initState();
    requestContactsPermission();
  }

  Future<void> requestContactsPermission() async {
    if (await Permission.contacts.request().isGranted) {
      if (await Permission.contacts.request().isGranted) {
        await fetchContacts();

        print('-----> ${_contacts.length}');
        Map<String,String> contactsMap = Map();

        for(var item in _contacts){
          //print('${contactsMap[item.displayName!]} ----> ${item.phones!.isNotEmpty?item.phones![0].toString():'empty'}');
          //contactsMap[item.displayName!] = item.phones!.isNotEmpty?item.phones![0].toString():'empty';
          contactsMap[item.displayName.toString()] = item.phones!.isNotEmpty
              ? item.phones!.first.value.toString()
              : 'No phone number';
        }
        List<Map<String,dynamic>> jsonObject = [];
        contactsMap.forEach((value,key) async {
          Map<String, dynamic> _map = Map();

          _map['number'] = key;
          _map['name'] =value;
          _map['rating'] = 0;
          _map['trait'] = 0;
          jsonObject.add(_map);

/*
          Map<String, dynamic> jsonObject = {
            'number': value,
            'name': key.toString(),
            'rating':0,
            'trait':0
          };
*/


        });
        print("govind api test >>>>>>>>${jsonObject}");

        print("contactssss>>>"+"${contactsMap.keys} hello");


        try{
          Dio dio = Dio();
          //var contacts = jsonEncode(jsonObject);
          print('object: $jsonObject');
          final response = await dio.post(ADD_CONTACT_URL,
              data: jsonEncode({
                "sender_id": "${AppPreferences.getSenderId()}",
                "contacts": jsonObject
              }),

              options: Options(headers: {
                // 'Content-Type': 'application/json',
                'Authorization': 'Bearer ${AppPreferences.getToken()}'
              }));
          print("govind api test >>>>>>>>${jsonObject}");

          print("saved contacts"+response.toString());

          print("Status code for contact updates>>>>>>>>> ${response.statusCode}");
         // print('Contact: $key, Phone: $value');
        }
        catch(error){
          print(error);
        }
      }
      else {
        // Handle the scenario when the user denies permission
        // or when the permission is permanently denied
      }
    }
  }





  Future<void> fetchContacts() async {
    Iterable<Contact> contacts =
    await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      _contacts = contacts.toList();
    });
  }
  bool isLoading = true;



  _callNumber({required String phone}) async{
    print('Hii'+phone);
    bool? res = await FlutterPhoneDirectCaller.callNumber(phone);
  }


  @override
  Widget build(BuildContext context) {
    print(_contacts.length.toString());
    bool small = false;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Contacts"),
        // ),
        body: DefaultTabController(
          length: 2,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/frigglybg.jpg"),
                  fit: BoxFit.cover,
                )),
            padding: const EdgeInsets.only(top: 27.5),
            child: Column(
              children: [
                // const AppBarcomon(),
                //Text("LEADERBOARD",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700,color: Colors.white),),
                TabBar(
                  labelStyle: TextStyle(fontSize: small ? 15.0 : 18.0),
                  labelColor: Colors.orangeAccent,
                  indicatorColor: Color(0xffFFCD46),

                  unselectedLabelColor: Colors.white,
                  tabs:  [
                    Tab(
                      text: 'Contacts',
                    ),
                    Tab(
                      text: 'Leaderboard  ',
                    ),

                  ],
                ),

                Expanded(
                    child: TabBarView(
                      children: [

                        ListView.builder(
                          itemCount: _contacts.length,
                          itemBuilder: (BuildContext context, int index) {
                            Contact contact = _contacts[index];
                            return
                              Row(
                                children: [
                                  Expanded(
                                    flex:3,
                                    child: InkWell(
                                      onTap: (){
                                        _callNumber(phone:contact.phones!.first.value.toString());

                                      },
                                      child: ListTile(
                                        leading: (contact.avatar != null && contact.avatar!.isNotEmpty)
                                            ? CircleAvatar(
                                            backgroundImage:NetworkImage("data:image/png;base64,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")
                                        )
                                            : CircleAvatar(
                                          child: Text(contact.initials()),
                                        ),
                                        title: Row(
                                          children: [
                                            Expanded(
                                                flex:4,
                                                child: Text(contact.displayName ?? '')),
                                            Spacer(),
                                            Expanded(
                                              flex: 1,
                                              child: InkWell(
                                                  onTap:(){
                                                    print("all contacts "+"${contact.phones!.first.value!}");
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Friends_Profile(namee:contact.displayName ?? '',mobile: contact.phones!.first.value.toString(),)));
                                                  },
                                                  child: Icon(Icons.arrow_forward_ios,color: Colors.grey,)),
                                            ),
                                          ],
                                        ),


                                        subtitle: Row(
                                          children: [

                                            Flexible(
                                              child: Text(contact.phones!.isNotEmpty
                                                  ? contact.phones!.first.value.toString()
                                                  : 'No phone number',style: TextStyle(color: Colors.white),),
                                            ),

                                           /*
                                           RatingBar.builder(
                                              initialRating: 0,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,size: 44,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            */

                                          ],
                                        ),

                                      ),
                                    ),
                                  ),
                                  // Spacer(),
                                  // Expanded(
                                  //     flex:1,
                                  //     child: InkWell(
                                  //         onTap:(){
                                  //           Navigator.push(context, MaterialPageRoute(builder: (context)=>Friends_Profile()));
                                  //         },
                                  //         child: Icon(Icons.arrow_forward_ios)))
                                ],
                              );
                          },
                        ),



                      /*  FutureBuilder(
                            future: ContactsService.getContacts(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData)
                                return Center(child: CircularProgressIndicator());
                              else(){
                                print("No data");
                              };
                              List<Contact> contacts =snapshot.data!.toList();
                              // List<contacts> entries = snapshot.data!.toList();

                              return Scrollbar(
                                child:
                                ListView.builder(
                                  //itemCount: 10,
                                  itemCount: contacts.length,
                                  itemBuilder: (context, index) {
                                    var contactt = contacts[index];
                                    return InkWell(
                                      onTap: (){
                                        _callNumber(phone:contactt.phones![0].value.toString());
                                       // contacts[11].phones![0].value.toString(),

                                      },
                                      child:
                                      ListTile(
                                        leading: Container(
                                          height: 30.h,
                                          width: 30.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 7,
                                                color: Colors.white.withOpacity(0.1),
                                                offset: const Offset(-3, -3),
                                              ),
                                              BoxShadow(
                                                blurRadius: 7,
                                                color: Colors.black.withOpacity(0.7),
                                                offset: const Offset(3, 3),
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(6.r),
                                            color: Color(0xff262626),
                                          ),
                                          child: Text(
                                            // "govind",
                                            "${contactt.displayName![0]}",
                                            //contacts[index].displayName![0] ?? "",
                                            style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.primaries[
                                              Random().nextInt(Colors.primaries.length)],
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                              //"kumar",
                                              "${contactt.displayName}",
                                              //contacts[index].displayName ?? "",
                                              //contacts[index].givenName!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                        subtitle: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(
                                              //"9876567898",
                                              //"${contacts![index].phones![0].value?? ""}",
                                              contacts[index].phones![0].value.toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                color:  Color(0xffC4c4c4),
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            RatingBar.builder(
                                              initialRating: 0,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,size: 44,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),

                                            InkWell(
                                                onTap:(){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Friends_Profile()));

                                                },
                                                child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,)),

                                          ],
                                        ),
                                        horizontalTitleGap: 12,
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),*/


                        //Leaderboar screen >>>>>>>>>>>>>>>>>>>>>>>>>>>
                        Leaderboardscreen(),

                      ],
                    ))
              ],
            ),
          ),),




  /*      isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          //itemCount: 10,
          itemCount: contacts.length!,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                height: 30.h,
                width: 30.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.white.withOpacity(0.1),
                      offset: const Offset(-3, -3),
                    ),
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(3, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6.r),
                  color: Color(0xff262626),
                ),
                child: Text(
                  // "govind",
                  contacts[index].displayName![0] ?? "",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.primaries[
                    Random().nextInt(Colors.primaries.length)],
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              title: Text(
                //"kumar",
                contacts[index].displayName ?? "",
                //contacts[index].givenName!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                //"9876567898",
                contacts[11].phones![0].value?? "",
                style: TextStyle(
                  fontSize: 15,
                  color:  Color(0xffC4c4c4),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
              horizontalTitleGap: 12,
            );
          },
        ),*/
      ),
    );
  }

}