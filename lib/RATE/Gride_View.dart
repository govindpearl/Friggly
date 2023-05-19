import 'package:flutter/material.dart';

import 'Multi_Label_Selection.dart';
class Grideview extends StatefulWidget {
  const Grideview({Key? key}) : super(key: key);

  @override
  State<Grideview> createState() => _GrideviewState();
}

class _GrideviewState extends State<Grideview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: new AppBar(
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          title: const Text('', style: TextStyle(
              color: Colors.white
          )),
          backgroundColor: Colors.greenAccent,
        ),
            body:
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/frigglybg.jpg"),
                    fit: BoxFit.cover,
                  )),
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(30),
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                crossAxisCount: 2,
                children: <Widget>[

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:  EdgeInsets.all(8),
                    child:  Center(child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset("assets/logo.jpg",height: 50,width: 50,),
                        Icon(Icons.ac_unit,size: 40,color: Colors.orangeAccent,),
                        SizedBox(height: 5,),
                        Text("Extrovert",style:TextStyle(color: Colors.black,fontSize: 20),),
                        SizedBox(height: 5,),
                        Text("5"),
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:  EdgeInsets.all(8),
                    child:  Center(child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset("assets/logo.jpg",height: 50,width: 50,),
                        Icon(Icons.handshake_rounded,size: 40,color: Colors.redAccent,),
                        SizedBox(height: 5,),
                        Text("Friendly",style:TextStyle(color: Colors.black,fontSize: 20),),
                        SizedBox(height: 5,),
                        Text("5"),
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:  EdgeInsets.all(8),
                    child:  Center(child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset("assets/logo.jpg",height: 50,width: 50,),
                        Icon(Icons.lightbulb_outlined,size: 40,color: Colors.blue,),
                        SizedBox(height: 5,),
                        Text("Intelligent",style:TextStyle(color: Colors.black,fontSize: 20),),
                        SizedBox(height: 5,),
                        Text("5"),
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:  EdgeInsets.all(8),
                    child:  Center(child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset("assets/logo.jpg",height: 50,width: 50,),
                        Icon(Icons.gpp_good,size: 40,color: Colors.green,),
                        SizedBox(height: 5,),
                        Text("Good Looking",style:TextStyle(color: Colors.black,fontSize: 18),),
                        SizedBox(height: 5,),
                        Text("5"),
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:  EdgeInsets.all(8),
                    child:  Center(child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset("assets/logo.jpg",height: 50,width: 50,),
                        Icon(Icons.gpp_good,size: 40,color:Color(0xffAE35F4),),
                        SizedBox(height: 5,),
                        Text("Patient",style:TextStyle(color: Colors.black,fontSize: 18),),
                        SizedBox(height: 5,),
                        Text("5"),
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:  EdgeInsets.all(8),
                    child:  Center(child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset("assets/logo.jpg",height: 50,width: 50,),
                        Icon(Icons.gpp_good,size: 40,color: Color(0xff0050C1),),
                        SizedBox(height: 5,),
                        Text("Trust Worthy",style:TextStyle(color: Colors.black,fontSize: 18),),
                        SizedBox(height: 5,),
                        Text("5"),
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:  EdgeInsets.all(8),
                    child:  Center(child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset("assets/logo.jpg",height: 50,width: 50,),
                        Icon(Icons.done_outline_outlined,size: 40,color: Colors.green,),
                        SizedBox(height: 5,),
                        Text("Honest",style:TextStyle(color: Colors.black,fontSize: 18),),
                        SizedBox(height: 5,),
                        Text("5"),
                      ],
                    )),
                  ),

                  Container(
                   // height: 66,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    //padding:  EdgeInsets.all(8),
                    child:  Center(child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       SizedBox(
                         height: 40,
                         width: double.infinity,
                         child: ElevatedButton(
                    style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),

                         // side: BorderSide(color: Colors.red)
                    )
                  )
                    ),
                           onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Multi_Label_select()));

                           }, child: Row(
                             children: [
                               Text("Submit",style: TextStyle(fontSize: 22),),
                               Icon(Icons.arrow_forward_ios_outlined)
                             ],
                           ),),
                       ),
                      ],
                    )),
                  ),

                ],
              ),
            )

    );
  }
}
