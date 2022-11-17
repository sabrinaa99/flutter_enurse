import 'dart:convert';
import '../../users/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


//remember data user
class RememberUserPrefs
{
  static Future<void> saveRememberUser(User userInfo) async
  {
    //initialized SharedPreferences
    SharedPreferences preferences = await SharedPreferences.getInstance();

    //save user data in json format and assign to userJsonDta
    String userJsonData = jsonEncode(userInfo.toJson());


    //user yg dah login successfully and user record is saved guna sharedpreferences
    await preferences.setString("currentUser", userJsonData);
  }
}