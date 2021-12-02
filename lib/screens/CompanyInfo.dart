import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyInfo extends StatefulWidget {
  const CompanyInfo({Key? key}) : super(key: key);

  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Company Info",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100,),
          Container(
            width: Get.width/1,
            alignment: Alignment.center,
            child: Text("Geeksynergy Technologies Pvt Ltd",style:TextStyle(
              color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
            )),
          ),
          SizedBox(height: 10,),
          Container(
            width: Get.width/1,
            alignment: Alignment.center,
            child: Text("Sanjayanagar, Bengaluru-56",style:TextStyle(
              color: Colors.black,fontSize: 15,
            )),
          ),
            SizedBox(height: 10,),
          Container(
            width: Get.width/1,
            alignment: Alignment.center,
            child: Text("XXXXXXXXX09",style:TextStyle(
              color: Colors.black,fontSize: 15,
            )),
          ),
             SizedBox(height: 10,),
          Container(
            width: Get.width/1,
            alignment: Alignment.center,
            child: Text("XXXXXX@gmail.com",style:TextStyle(
              color: Colors.black,fontSize: 15,
            )),
          ),
        ],
      ),
    );
  }
}
