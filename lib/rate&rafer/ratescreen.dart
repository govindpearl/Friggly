import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ratescreen extends StatefulWidget {
  const ratescreen({Key? key}) : super(key: key);

  @override
  State<ratescreen> createState() => _ratescreenState();
}

class _ratescreenState extends State<ratescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 45,bottom: 10,left: 16,right: 16),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg2.jpg"),
                  fit: BoxFit.cover,
                )),
            child: Column(children: [
              Text("Rate Your Contacts",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30,color: Color(0xffffffff)),),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 15),
                child: TextField(
                  //controller: useremailController,
                  decoration: InputDecoration(
                   // filled: true, //<-- SEE HERE
                    fillColor: Color(0xffffffff),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    //Hides label on focus or if filled
                    labelText: "Search Contacts",
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
                    prefixIcon: Icon(Icons.search, size: 24),
                  ),
                ),
              ),
            ],),
            height: 200,
            width: double.infinity,
            //color: Colors.lightGreen,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => const Divider(),

                  shrinkWrap: true,
                  physics:  NeverScrollableScrollPhysics(),
                  itemBuilder: (context , int index){
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height:50,
                          width: 50,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              //onTap: imagePickerOption,
                              child: Image.network("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",fit: BoxFit.fill,)
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Govind kumar",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Color(0xff1A9286)),),
                          Text("7898778879"),
                        ],),
                        Spacer(),
                        RatingBar.builder(
                          //initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          //itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => Icon(Icons.star,size: 10, color: Colors.amber,),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    );

                  },
                  itemCount: 11,
                ),
              ),
            ),
          )

        ],
      ),
    ),);
  }
}
