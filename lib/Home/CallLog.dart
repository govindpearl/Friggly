import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dialpad/flutter_dialpad.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:marquee/marquee.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:workmanager/workmanager.dart';

import '../profile/friends_profile.dart';
import 'Dialpad.dart';

///TOP-LEVEL FUNCTION PROVIDED FOR WORK MANAGER AS CALLBACK
// void callbackDispatcher() {
//   Workmanager().executeTask((dynamic task, dynamic inputData) async {
//     print('Background Services are Working!');
//     try {
//       final Iterable<CallLogEntry> cLog = await CallLog.get();
//       print('Queried call log entries');
//       for (CallLogEntry entry in cLog) {
//         print('-------------------------------------');
//         print('F. NUMBER  : ${entry.formattedNumber}');
//         print('C.M. NUMBER: ${entry.cachedMatchedNumber}');
//         print('NUMBER     : ${entry.number}');
//         print('NAME       : ${entry.name}');
//         print('TYPE       : ${entry.callType}');
//         print('DATE       : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp)}');
//         print('DURATION   : ${entry.duration}');
//         print('ACCOUNT ID : ${entry.phoneAccountId}');
//         print('ACCOUNT ID : ${entry.phoneAccountId}');
//         print('SIM NAME   : ${entry.simDisplayName}');
//         print('-------------------------------------');
//       }
//       return true;
//     } on PlatformException catch (e, s) {
//       print(e);
//       print(s);
//       return true;
//     }
//   });
// }

// void main() {
//   runApp(MyApp());
//   Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
// }

/// example widget for call log plugin
class CallLogScreen extends StatefulWidget {
  const CallLogScreen({Key? key}) : super(key: key);
  @override
  _CallLogScreenState createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {


  List<CallLogEntry> _callLogs = [];

  @override
  void initState() {
    super.initState();
    requestCallLogPermission();
  }

  Future<void> requestCallLogPermission() async {
    if (await Permission.phone.request().isGranted) {
      fetchCallLogs();
    }
  }

  Future<void> fetchCallLogs() async {
    Iterable<CallLogEntry> callLogs = await CallLog.get();
    setState(() {
      _callLogs = callLogs.toList();
    });
  }















  Iterable<CallLogEntry> _callLogEntries = <CallLogEntry>[];

  void initializeData() async {
    final Iterable<CallLogEntry> result = await CallLog.query();
    setState(() {
      _callLogEntries = result;
    });
  }


/*  @override
  void initState() {
    initializeData();
    super.initState();
  }*/


  _callNumber({required String phone}) async{
    print('Hii'+phone);
    bool? res = await FlutterPhoneDirectCaller.callNumber(phone);
  }

  @override
  Widget build(BuildContext context) {


    return
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.transparent
          ),
          title: const Text('', style: TextStyle(
              color: Colors.white
          )),
          backgroundColor: Colors.greenAccent,
        ),
       // appBar: AppBar(title: const Text('call_log example')),
        body:
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/frigglybg2.jpg"),
                fit: BoxFit.cover,
              )),
          child: Stack(
            children: [

              FutureBuilder(
                  future: CallLog.get(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: CircularProgressIndicator());
                    else(){
                      print("No data");
                    };

                    List<CallLogEntry> entries = snapshot.data!.toList();

                    return
                      Scrollbar(
                      child:


                      ListView.builder(
                        itemCount: _callLogs.length,
                        itemBuilder: (BuildContext context, int index) {
                          CallLogEntry callLog = _callLogs[index];
                          return Row(
                            children: [
                              Expanded(
                                flex:4,
                                child: InkWell(
                                  onTap: (){
                                    _callNumber(phone:callLog.number ?? '');

                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Icon(Icons.person),
                                    ),
                                    title: Text(callLog.name ?? 'Unknown number',style: TextStyle(color: Colors.white,fontSize: 17)),
                                    subtitle: Row(
                                      children: [
                                        Text(callLog.number ?? '',style: TextStyle(color: Colors.white70)),
                                        SizedBox(width: 16,),
                                        Text(callLog.callType.toString().split(" ")[0].replaceRange(0, 9, "")?? "",style: TextStyle(color: Colors.white70),),
                                         //Text(callLog.duration)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                             // Spacer(),
                              Expanded(
                                flex:0,
                                child: InkWell(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Friends_Profile(namee: callLog.name ?? 'Unknown number',mobile: callLog.number ?? '',)));
                                    },
                                    child: Icon(Icons.arrow_forward_ios)),
                              ),
                              SizedBox(width: 5,),
                            ],
                          );
                        },
                      ),





                    /*  ListView.builder(
                        itemBuilder: (context, index) {
                          var entry = entries[index];
                          var mono = TextStyle(fontFamily: 'monospace');
                          return Column(
                            children: [
                              Divider(),
                              InkWell(

                                onTap: () {
                                  _callNumber(phone:entry.number!);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16,right: 16),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      CircleAvatar(
                                        radius: 20,

                                        //borderRadius: BorderRadius.circular(100),
                                        //onTap: imagePickerOption,
                                        child:
                                          //Icon(Icons.person),

                                        entry.name!.isNotEmpty? Text('${entry.name![0]}'): Icon(Icons.person),
                                        //Image.network("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",fit: BoxFit.fill,)
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          entry.name!.isNotEmpty? Text('${entry.name!}'):
                                         Text('${entry.number}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Color(0xff1A9286)),),
                                          //phonenumber=   Text('${entry.number}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Color(0xff1A9286)),),
                                          //Text("hello"+phonenumber.toString()??""),
                                          //Text("Govind kumar",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Color(0xff1A9286)),),
                                          Row(children: [
                                            Text('${entry.callType.toString().split(" ")[0].replaceRange(0, 9, "")?? ""}', style: mono),
                                            SizedBox(width: 10,),

                                            Text('${DateTime.fromMillisecondsSinceEpoch(entry.timestamp).toString().split(" ")[1].replaceRange(5,12,"")?? ""}',style: mono),
                                           // Text('${DateTime.fromMillisecondsSinceEpoch(entry.timestamp).toString()?? ""}',style: mono),

                                          ],),
                                          // Text('${DateTime.fromMillisecondsSinceEpoch(entry.timestamp)}', style: mono),
                                        ],),
                                      Spacer(),
                                      InkWell(
                                          onTap:(){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Friends_Profile()));
                                          },
                                          child: Icon(Icons.arrow_forward_ios)),
                                    ],
                                  ),
                                ),
                              ),


                              // Text('F. NUMBER: ${entry.formattedNumber}',
                              //     style: mono),
                              // Text('NUMBER   : ${entry.number}', style: mono),
                              // Text('NAME     : ${entry.name}', style: mono),
                              // Text('TYPE     : ${entry.callType}', style: mono),
                              // Text(
                              //     'DATE     : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp)}',
                              //     style: mono),
                              // Text('DURATION :  ${entry.duration}',
                              //     style: mono),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                          );
                        },
                       // itemCount: 11,
                        itemCount: entries.length,
                      ),*/





                    );
                  }),
              Positioned(
                  right: 20,
                  bottom: 20,
                  child: InkWell(
                    onTap:  (){_showBottomSheetDialog(context:context);},
                    //_showBottomSheetDialog(context:context)

                    // {
                    // //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen()));
                    //
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) => DialPad()));
                    // },
                    child: CircleAvatar(
                        backgroundColor: Colors.cyan,
                        child: Icon(Icons.dialpad,size: 30,)),
                  )),
            ],
          ),
        ),
      );
  }


_showBottomSheetDialog(
    {required BuildContext context}) {
 // TextEditingController usernameController = TextEditingController();
  // Future<String> getData() {
  //   return Future.delayed(Duration(seconds: 2), () {
  //     return "I am data";
  //     // throw Exception("Custom Error");
  //   });
  // }

  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        //var _namecontroller;
        return DialPad(
            enableDtmf: true,
            //outputMask: "(000) 000-0000",
            hideSubtitle: false,

            backspaceButtonIconColor: Colors.red,
            buttonTextColor: Colors.black,
            dialOutputTextColor: Colors.black,
            keyPressed: (value) async {

              print('$value was pressed');
            },
            makeCall: (numberr) async {
              print(numberr);
              var number ="${numberr?? ""}"; //set the number here
              bool? res = await FlutterPhoneDirectCaller.callNumber(number);

              // Uri phoneno = Uri.parse('tel:'"${number}");
              // if (await launchUrl(phoneno)) {
              // //dialer opened
              // }else{
              // //dailer is not opened
              // }
            }
        );
      });
}

}

