import 'dart:convert';

import 'package:my_task/utils/SharedPrefKeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  Future<String>setData(Map data,key)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(data));
   
    return 'success';
  }

  Future<String>getData(keys)async{
   SharedPreferences prefs=await SharedPreferences.getInstance();
   String? data=prefs.getString(keys);
   
   return data??'0';

  }
   Future<String>removeData(keys)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
   prefs.remove(keys);
   return 'done';

  }
}