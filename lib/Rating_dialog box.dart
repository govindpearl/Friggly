import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'API_COLLECTION.dart';
import 'ModelClass/Get_Traits_Model.dart';
import 'app_preferences.dart';


class AddressDialog extends StatefulWidget {

   final String? mobile,namee;

   AddressDialog({Key? key,this.mobile,this.namee}) : super(key: key);
  @override
  _AddressDialogState createState() => _AddressDialogState();
}

class _AddressDialogState extends State<AddressDialog> {
  List<int> selectedItems = [0,0,0,0,0,0];
  String listItem = '';


  void selectItem(int index) {
    setState(() {
      if(selectedItems[index] ==1){
        selectedItems[index] =0;
      }else{
        selectedItems[index] =1;
      }
    });
  }

  // void selectItem(int index) {
  //   setState(() {
  //     if (selectedItems.contains(index)==0) {
  //       //selectedItems.remove(index);
  //       selectedItems[index] =1;
  //
  //     } else {
  //       selectedItems[index] =0;
  //       //selectedItems.add(index);
  //     }
  //   });
  // }



  String rate = "";
  TextEditingController review = TextEditingController();

 // List<int> index = [1,2,3,4];
  //String listItem = '';
  // index.forEach((element) {
  // print(element);
  // listItem += element.toString()+', ';
  //
  // });


  @override
  Widget build(BuildContext context) {
    selectedItems.forEach((element) {
      print("elementss${element}");
  listItem = element.toString()+', ';
  print("list irms ${listItem}");

  });

    print("govind ${selectedItems}");
   // print(selectedItems);

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
              //  Text("${widget.mobile}"),
                Text(
                  "${widget.namee}",
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

                        print("helloo${rating}");

                        setState(() {
                          rate = rating.toString();
                        });


                        print("print rate ${rate}");

                      },

                    ),
                  ],
                ),
                SizedBox(height: 20,),

                Text("Would you recommend him/her for below qualities ?", textAlign: TextAlign.center,),


                Container(
                  height:230,

                  child: Column(

                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Text(
                          'Select qualities',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),





                        FutureBuilder<Get_Traits_Model?>(
                          future: traits(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              // API call succeeded, use the data

                              return // Text(snapshot!.data!.traits![0].traitName.toString());

                                Expanded(
                                  child:
                                  GridView.builder(
                                    itemCount: snapshot.data!.traits!.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    ),
                                    itemBuilder: (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () => selectItem(index),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  image:

                                                  DecorationImage(
                                                    image:
                                                        NetworkImage(snapshot!.data!.traits![index].traitImage.toString()),
                                                    //AssetImage('assets/extrovert.jpg'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      //top:12,
                                                      bottom: 1,
                                                      child: Text(
                                                        '',
                                                        //'Extrovert ${index + 1}',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),

                                                    //        selectedItems[index] =1;
                                                    if (selectedItems[index]==1)
                                                      Container(
                                                        color: Colors.black.withOpacity(0.5),
                                                      ),

                                                  ],
                                                ),
                                              ),
                                            ),

                                            Text(
                                              '${snapshot.data!.traits![index].traitName.toString()}',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );


                            } else if (snapshot.hasError) {
                              // API call failed, show error message
                              return Text('Error: ${snapshot.error}');
                            }

                            // API call still in progress, show a loading indicator
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                    ],
                  ),
                ),



                SizedBox(height: 20),
                /*Column(
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
                ),*/
                //Text("Add Review",textAlign: TextAlign.start,),
                TextField(
                  minLines: 8,
                  maxLines: 10,
                   controller: review,
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
                SizedBox(height: 15,),
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
                          fontSize: 20,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap:  () {

                        Ratereview(widget.mobile.toString(),selectedItems.toString(),rate,review.text.toString());
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 20,
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

Future<void> Ratereview(mobile,trait,ratee,revieww,)  async{

  var headers = {
    'Authorization': 'Bearer ${AppPreferences.getToken()}'
  };

  var request = http.MultipartRequest('POST', Uri.parse(UPDATE_CONTACTS_URL));
  request.fields.addAll({
    'contact_number': mobile,
    'traits': trait,
    'rating': ratee,
    'contact_name': revieww
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: "Review update Successfully",textColor: Colors.green);
    print("api rate print mobile number ${mobile}");
    print("api rate print trait        ${trait}");
    print("api rate print ratee        ${ratee}");
    print("api rate print revieww      ${revieww}");

    print(await response.stream.bytesToString());
    Navigator.pop(context);

  }
  else {
    Fluttertoast.showToast(msg: "Server error",textColor: Colors.red);

    print(response.reasonPhrase);
  }


}






  Future<Get_Traits_Model?> traits() async {
    // Create Dio instance
    Dio dio = Dio();

    // Define the headers
    Map<String, String> headers = {
      'Authorization': 'Bearer ${AppPreferences.getToken()}'
      //'Authorization': 'Bearer 272|zOSOR7ks4vioa05Rp8YwM61GTFAIpybBUSiX3WYv',
    };

    // Define the API endpoint
    String url = GET_TRAITS_URL;

    try {
      // Make the API call
      Response response = await dio.get(url, options: Options(headers: headers));

      // Handle the response
      if (response.statusCode == 200) {
        return Get_Traits_Model.fromJson(response.data);

        // API call successful
        print(response.data);
      } else {
        // API call failed
        print('API call failed with status code ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors
      print('An error occurred: $error');
    }
  }







}
