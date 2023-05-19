import 'dart:math';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_popup/internet_popup.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Leaderboard/leaderboardscreen.dart';
import '../RATE/Gride_View.dart';
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
  List<Contact> contacts = [];

  bool isLoading = true;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
   // InternetPopup().initialize(context: context);

    getContactPermission();
  }

  void getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  void fetchContacts() async {
    contacts = await ContactsService.getContacts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        FutureBuilder(
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
                                child:ListView.builder(
                                  //itemCount: 10,
                                  itemCount: contacts.length,
                                  itemBuilder: (context, index) {
                                    var contactt = contacts[index];
                                    return InkWell(onTap: (){
                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>Grideview()));
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Friends_Profile()));
                                    },
                                      child: ListTile(
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
                                              contacts[11].phones![0].value.toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                color:  Color(0xffC4c4c4),
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            RatingBar.builder(
                                              initialRating: 3,
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
                                          ],
                                        ),
                                        horizontalTitleGap: 12,
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),


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