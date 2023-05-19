import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
enum SampleItem { itemOne, itemTwo, itemThree,itemfour }

class MessageScreen extends StatefulWidget {

  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {


  List<Contact> contacts = [];

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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




  SampleItem? selectedMenu;
  var color = Colors.pink;
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 1,bottom: 1,left: 1,right: 1),
            decoration: BoxDecoration(
              color: Colors.white
                // image: DecorationImage(
                //   image: AssetImage("assets/bg2.jpg"),
                //   fit: BoxFit.cover,
                // )
            ),
            child: Column(children: [
             // Text("Messages",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 40,color: Color(0xffffffff)),),
             // SizedBox(height: 44,),
              TextField(
                //controller: useremailController,
                decoration: InputDecoration(
                  // filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  //Hides label on focus or if filled
                  labelText: "Search",
                  filled: true,
                  // Needed for adding a fill color
                  //fillColor: Colors.grey.shade800,
                  isDense: true,
                  // Reduces height a bit
                  border: OutlineInputBorder(
                    // borderSide: BorderSide.none,              // No border
                    borderRadius:
                    BorderRadius.circular(12), // Apply corner radius
                  ),
                  prefixIcon: Icon(Icons.menu, size: 24),
                    suffixIcon: Image.asset("assets/optionmenu.png"),
                ),
              ),
            ],),
           // height: 200,
            width: double.infinity,
            //color: Colors.lightGreen,
          ),

          Expanded(
            child:
            isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
              //itemCount: 10,
               itemCount: contacts.length!,
              itemBuilder: (context, index) {
                return

                  ElevatedButton(
                    style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),

                    onPressed: ()
                   async{
                      // Uri sms = Uri.parse('sms:'+"${contacts[11].phones![0].value??""}");
                      // if (await launchUrl(sms)) {
                      //   //app opened
                      // }else{
                      //   //app is not opened
                      // }
                   },
                    child: ListTile(
                    leading: Container(
                      height: 30,
                      width: 30,
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
                      contacts[11].phones![0].value ?? "",
                      style: TextStyle(
                        fontSize: 11,
                        color:  Color(0xffC4c4c4),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    horizontalTitleGap: 12,
                ),
                  );
              },
            ),

            // SingleChildScrollView(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: ListView.separated(
            //       separatorBuilder: (BuildContext context, int index) => const Divider(),
            //
            //       shrinkWrap: true,
            //       physics:  NeverScrollableScrollPhysics(),
            //       itemBuilder: (context , int index){
            //         return
            //           InkWell(
            //             // onTap: (){
            //             //   Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChatUi()));
            //             // },
            //             child: Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               SizedBox(
            //                 height:50,
            //                 width: 50,
            //                 child: ClipRRect(
            //                     borderRadius: BorderRadius.circular(100),
            //                     //onTap: imagePickerOption,
            //                     child: Image.network("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",fit: BoxFit.fill,)
            //                 ),
            //               ),
            //               SizedBox(width: 10,),
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text("Govind kumar",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Color(0xff1A9286)),),
            //                   Text("7898778879"),
            //                 ],),
            //               Spacer(),
            //               PopupMenuButton<SampleItem>(
            //                 initialValue: selectedMenu,
            //                 // Callback that sets the selected popup menu item.
            //                 onSelected: (SampleItem item) {
            //                   setState(() {
            //                     selectedMenu = item;
            //                   });
            //                 },
            //                 itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            //                   const PopupMenuItem<SampleItem>(
            //                     value: SampleItem.itemOne,
            //                     child: Text('Show'),
            //                   ),
            //                   const PopupMenuItem<SampleItem>(
            //                     value: SampleItem.itemTwo,
            //                     child: Text('Create'),
            //                   ),
            //                   const PopupMenuItem<SampleItem>(
            //                     value: SampleItem.itemThree,
            //                     child: Text('Block'),
            //                   ),
            //                   const PopupMenuItem<SampleItem>(
            //                     value: SampleItem.itemfour,
            //                     child: Text('Spam'),
            //                   ),
            //                 ],
            //               ),                      ],
            //         ),
            //           );
            //
            //       },
            //       itemCount: 11,
            //     ),
            //   ),
            // ),
          )

        ],
      ),
    ),);
  }
}
