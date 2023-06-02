

import 'package:shared_preferences/shared_preferences.dart';


class AppPreferences {
  static late SharedPreferences _preferences;

  static Future init() async => _preferences = await SharedPreferences.getInstance();



  static void saveCredentials({
    required String id,
    required String token,
    required String phoneNumber,}) {
    _preferences.setString('id', id);
    _preferences.setString('token', token);
    _preferences.setString('phone', phoneNumber);
    _preferences.setBool('isLogin', true);


    //_preferences.setString(AppKeys.userDisplayName, displayName);
  }

  static void clearCredentials() {
    _preferences.clear();
    _preferences.setBool('onboarding', false);


  }


  static String getToken() {
    String s = _preferences.getString('token') ?? '';
    return s;
  }
  static String getPhoneNumber() {
    String s = _preferences.getString('phone') ?? '';
    return s;
  }

  static String getSenderId() {
    String s = _preferences.getString('id') ?? '';
    return s;
  }

  static void setShowOnBoarding(bool value) {
    _preferences.setBool('onboarding', value);
  }

  static bool getShowOnBoarding() {
    bool s = _preferences.getBool('onboarding') ?? true;
    return s;
  }

  static bool getIsUserLogin() {
    bool s = _preferences.getBool('isLogin') ?? false;
    return s;
  }
}
