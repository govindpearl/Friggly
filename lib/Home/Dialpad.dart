import 'package:flutter/material.dart';
import 'package:flutter_dialpad/flutter_dialpad.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
class Dailpad extends StatefulWidget {
  const Dailpad({Key? key}) : super(key: key);

  @override
  State<Dailpad> createState() => _DailpadState();
}

class _DailpadState extends State<Dailpad> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child:
            DialPad(
                enableDtmf: false,
                //outputMask: "(000) 000-0000",
                hideSubtitle: false,
                backspaceButtonIconColor: Colors.red,
                buttonTextColor: Colors.white,
                dialOutputTextColor: Colors.white,
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
            )
        ),
      ),
    );
  }
}
