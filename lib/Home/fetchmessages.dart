/*
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class SMSFetch extends StatefulWidget {
  @override
  _SMSFetchState createState() => _SMSFetchState();
}

class _SMSFetchState extends State<SMSFetch> {
  List<SmsMessage> _messages = [];
  SmsQuery query = new SmsQuery();

  @override
  void initState() {
    super.initState();
    _fetchSMS();
  }

  Future<void> _fetchSMS() async {
    List<SmsMessage> messages = await query.getAllSms;
  setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.transparent
        ),
        title: const Text('', style: TextStyle(
            color: Colors.white
        )),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/frigglybg2.jpg"),
              fit: BoxFit.cover,
            )),
        child: ListView.builder(
          itemCount: _messages.length,
          itemBuilder: (context, index) {
            SmsMessage message = _messages[index];

            return Card(
              shape: RoundedRectangleBorder( //<-- SEE HERE

                side: BorderSide(
                  color: Colors.greenAccent,
                ),
                borderRadius: BorderRadius.circular(14.0),
              ),
              elevation: 0,
              color: Colors.transparent,
              child: ListTile(
                title: Text(message.sender),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(message.body),
                    Text(message.dateSent.toString()),
                    Text("total messages"+message.id.toString()),
                    //Text(message.date.toString()),
                   // Text("dataaa"),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}*/
