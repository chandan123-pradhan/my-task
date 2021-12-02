import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/screens/CompanyInfo.dart';
import 'package:my_task/screens/LoginScreen.dart';
import 'package:my_task/utils/SharedPrefKeys.dart';
import 'package:my_task/utils/sharedPref.dart';
import 'package:my_task/widget/toastWidget.dart';


class DrawerPage extends StatefulWidget {
  const DrawerPage({ Key? key }) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  SharedPref prefs=SharedPref();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
     Container(
       height:100,
       color:Colors.blue,
     ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: (){
              Get.to(CompanyInfo());
            },
            child: Container(
              width: Get.width/1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Company Info",
                  style: TextStyle(
                    color: Colors.blue,fontSize:18,fontWeight: FontWeight.bold
                  ),
                  ),
                  Icon(Icons.navigate_next,size:30,color:Colors.blue,)
                ],
              ),
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: (){
                prefs.removeData(SharedPrefKeys.registerData);
                 showSuccessToast("Logout Successfully done");
                Get.offAll(LoginPage());
            },
            child: Container(
              width: Get.width/1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Logout",
                  style: TextStyle(
                    color: Colors.blue,fontSize:18,fontWeight: FontWeight.bold
                  ),
                  ),
                  Icon(Icons.navigate_next,size:30,color:Colors.blue,)
                ],
              ),
            ),
          ),
        )
      ],
      
    );
  }
}