import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';

class AddressDialog extends StatefulWidget {
  @override
  _AddressDialogState createState() => _AddressDialogState();
}

class _AddressDialogState extends State<AddressDialog> {
  String rate = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 400, // Update the width value to your desired width
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Govind',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: 0,
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
                        setState(() {
                          rate = rating.toString();
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                Text("Would you recommend him/her for below qualities ?", textAlign: TextAlign.center,),

                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  "assets/extrovert.jpg",
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                            ),
                            Text("1"),
                            Text("Extrovert"),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  "assets/extrovert.jpg",
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                            ),
                            Text("1"),
                            Text("Friendly"),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  "assets/extrovert.jpg",
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                            ),
                            Text("1"),
                            Text("Intelligent"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  "assets/extrovert.jpg",
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                            ),
                            Text("1"),
                            Text("Good Looking"),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  "assets/extrovert.jpg",
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                            ),
                            Text("1"),
                            Text("Patient"),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  "assets/extrovert.jpg",
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                            ),
                            Text("1"),
                            Text("Trustworthy"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  "assets/extrovert.jpg",
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                            ),
                            Text("1"),
                            Text("Honest"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
                //Text("Add Review",textAlign: TextAlign.start,),
                TextField(
                  minLines: 8,
                  maxLines: 10,

                  textInputAction: TextInputAction.newline,

                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                   hintText: 'Write a review',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Color(0xffE8E8E8),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap:  () {},
                      child: Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
