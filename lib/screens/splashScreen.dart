import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/screens/HomeScreen.dart';
import 'package:my_task/screens/LoginScreen.dart';
import 'package:my_task/utils/SharedPrefKeys.dart';
import 'package:my_task/utils/sharedPref.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
SharedPref pref=SharedPref();
void navigator(){
  pref.getData(SharedPrefKeys.registerData).then((value) {
    print(value);
  if(value!='0'){
    Get.offAll(HomeScreen());
  }else{
    Get.offAll(LoginPage());
  }
  });
}



@override
  void initState() {
    navigator();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Text("My Task",
        style:TextStyle(color:Colors.black,fontSize:20,fontWeight:FontWeight.bold)
        )
      ),
      
    );
  }
}