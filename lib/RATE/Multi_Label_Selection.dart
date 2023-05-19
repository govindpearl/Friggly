import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'Label_Model.dart';
import 'Rating_review.dart';

class Multi_Label_select extends StatefulWidget {
  @override
  _Multi_Label_selectState createState() => _Multi_Label_selectState();
}

class _Multi_Label_selectState extends State<Multi_Label_select> {
  List<ContactModel> contacts = [
    ContactModel("Extrovert", false),
    ContactModel("Friendly", false),
    ContactModel("Intelligent", false),
    ContactModel("Good Looking", false),
    ContactModel("Patient", false),
    ContactModel("Trust Worthy", false),
    ContactModel("Honest", false),
  ];

  List<ContactModel> selectedContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        title: const Text('', style: TextStyle(
            color: Colors.white
        )),
        backgroundColor: Colors.greenAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg1.jpg"),
                  fit: BoxFit.cover,
                )),
            padding: EdgeInsets.only(left: 20,top: 15),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(110),
                    child: Image.asset("assets/mic.jpg",height: 120,width: 120,)),
                SizedBox(height: 15,),
                Container(
                  height: 40,
                  width: 130,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(12),
                    color: Colors.white,

                  ),
                  child: Center(child: Text("RATING",style: TextStyle(fontSize: 26,color: Color(0xff0C453E),fontWeight: FontWeight.w700),)),
                ),
SizedBox(height: 10,),
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


                Text("What would you recommend\nHim/Her from below qualities?",style: TextStyle(fontSize: 25,color:Colors.white,),),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics:  NeverScrollableScrollPhysics(),
                      itemCount: contacts.length,
                      itemBuilder: (BuildContext context, int index) {
                        // return item
                        return ContactItem(
                          contacts[index].name,
                          //contacts[index].phoneNumber,
                          contacts[index].isSelected,
                          index,
                        );
                      }),
                ),
                selectedContacts.length > 0 ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      //color: Colors.green[700],
                      child: Text(
                        "Submit (${selectedContacts.length})",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Rating_Review()));
                       // print("Delete List Lenght: ${selectedContacts.first}");
                      },
                    ),
                  ),
                ): Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ContactItem(
      String name, bool isSelected, int index) {
    return ListTile(
      leading:
      isSelected
          ? Icon(
        Icons.check_circle,size: 37,
        color: Colors.green[700],
      )
          : Icon(

        Icons.check_circle_outline,size: 30,
        color: Colors.grey,
      ),
      onTap: () {
        setState(() {
          contacts[index].isSelected = !contacts[index].isSelected;
          if (contacts[index].isSelected == true) {
            selectedContacts.add(ContactModel(name, true));
            print("hello"+" ${name}");
          } else if (contacts[index].isSelected == false) {
            selectedContacts
                .removeWhere((element) => element.name == contacts[index].name);
          }
        });
      },
      title: Text(
        name,
        style: TextStyle(
          fontSize: 24,color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      //subtitle: Text(phoneNumber),
    );
  }
}
