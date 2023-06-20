import 'dart:convert';

import 'package:get/get.dart';
import '../ModelClass/user_profile_model.dart';
import 'package:http/http.dart' as http;

import '../app_preferences.dart';

class Userprofiledetails extends GetxController{
  var isLoading = false.obs;
  UserProfileModel? userProfileModel;


@override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }


  void fetchData() async {
    var headers = {
      'Authorization': 'Bearer ${AppPreferences.getToken()}'
    };

    var uri = Uri.parse('https://test.pearl-developer.com/friglly/public/api/get-profile');

    try {
      isLoading(true);
      var response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        userProfileModel= UserProfileModel.fromJson(result);


        print(response.body);
      } else {
        print("error fetching data");
        print(response.reasonPhrase);
      }
    } catch (error) {
      print('Error: $error');
    }
    finally{
      isLoading(false);
    }
  }





}