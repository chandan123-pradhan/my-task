import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:my_task/utils/NetworkConstant.dart';
class HomeRepository{
  
Future<dynamic>getHomeData(Map data)async{
 var response=await http.post(
   Uri.parse(NetworkConstant.baseUrl),
   body: data
 );
 print(response.body);
 if(response.statusCode==200){
   var res=jsonDecode(response.body);
   return res;
 }else{
   print("Something went wrong");
   return 'faild';
 }

}
}