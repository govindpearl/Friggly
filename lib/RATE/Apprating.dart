import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class apprating extends StatefulWidget {
  const apprating({Key? key}) : super(key: key);

  @override
  State<apprating> createState() => _appratingState();
}

class _appratingState extends State<apprating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        padding: EdgeInsets.only(top: 100,left: 40,right: 40),
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg1.jpg"),
              fit: BoxFit.cover,
            )),
        child:
        Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(110),
                child: Image.asset("assets/ratingimg.png",height: 240,width: 240,)),
            SizedBox(height: 2,),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Rate Friggly App",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),

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
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    SizedBox(
                      height: 36,
                     // width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0),

                                   side: BorderSide(color: Colors.red)
                                )
                            )
                        ),
                        onPressed: (){

                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>Multi_Label_select()));

                        }, child: Text("Cancel",style: TextStyle(color:Colors.red,fontSize: 22),),),
                    ),
                    SizedBox(
                      height: 36,
                      //width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),

                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0),

                                  // side: BorderSide(color: Colors.red)
                                )
                            )
                        ),
                        onPressed: (){

                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>Multi_Label_select()));

                        }, child: Text("Submit",style: TextStyle(fontSize: 22),),),
                    ),


                  ],)
                ],
              ),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(10)
              ),
            )

          ],
        ),
      ),
    );
  }
}
