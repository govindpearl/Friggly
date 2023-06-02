import 'package:flutter/material.dart';
import 'package:friggly/loginflow/Signupscreen.dart';

class PrivacyPage extends StatefulWidget {
  final String? token,mobile;

  const PrivacyPage({Key? key,required this.token,required this.mobile,}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg1.jpg"),
                fit: BoxFit.cover,
              )),
          padding: EdgeInsets.only(left: 16,right: 16,top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back,size: 30,)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/PrivacyPolicy.jpg'),
                          radius: 60,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Your privacy is important to us',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Please take time to review the key points of our privacy policy and terms of service below:',
                      ),
                      SizedBox(height: 20),
                      Card(
                        child: ExpansionTile(
                          title: Row(
                            children: [
                              Icon(Icons.data_thresholding_outlined,color: Colors.green,),
                              SizedBox(width: 10,),
                              Text(
                                "Data we process",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "helllooo",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Card(
                        child: ExpansionTile(
                          title:
                          Row(children: [
                            Icon(Icons.gradient_sharp,color: Colors.green,),
                            SizedBox(width: 10,),
                            Text("How we use your data", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                            ),
                          ],),


                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "helllooo",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Card(
                        child: ExpansionTile(
                          title: Row(
                            children: [
                              Icon(Icons.medical_information_outlined,color: Colors.green,),
                              SizedBox(width: 10,),
                              Text(
                                "We empower you on how to\n be seen on Truecaller",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "helllooo",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Card(
                        child: ExpansionTile(
                          title:

                          Row(
                            children: [
                              Icon(Icons.mobile_friendly,color: Colors.green,),
                              SizedBox(width: 10,),
                              Text("Unnecessary permission? \nWe never ask for it", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),),
                            ],
                          ),

                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "helllooo",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Card(
                        child: ExpansionTile(
                          title: Row(
                            children: [
                              Icon(Icons.phone_locked,color: Colors.green,),
                              SizedBox(width: 10,),
                              Text(
                                "Your number is always \nconfidential",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "helllooo",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 40),

                      Container(
                        padding: EdgeInsets.all(16),
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0xffF3E3C3),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Icon(Icons.security),
                        SizedBox(width:7,),
                        Text("By clicking Agree & Continue you agree \nto our Privacy Policy and Terms of Service.")
                        ],),
                      ),

                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>signupscreen(
                              token: widget.token,mobile: widget.mobile
                            )));
                            // Handle Agree&continue button press
                          },
                          child: Text('AGREE & CONTINUE',style: TextStyle(fontSize: 20),),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.yellow,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}