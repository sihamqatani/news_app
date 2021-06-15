import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CasheHelper{
  static SharedPreferences sharedPreferences;
  static init()async{

  sharedPreferences= await  SharedPreferences.getInstance() ;
  }
  static Future<bool>booleanData({@required String key,@required bool value})async{
    return  await sharedPreferences.setBool(key, value);
  }
  static bool getBooleanData({@required String key}){
    return sharedPreferences.getBool(key);
  }

}