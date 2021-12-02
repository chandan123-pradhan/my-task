import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/Repository/HomeRepository.dart';

import 'DrawerPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  List<dynamic> dataList = [];
  void callHomeData() {
    setState(() {
      isLoading = true;
    });
    Map data = {
      'category': 'movies',
      'language': 'kannada',
      'genre': 'all',
      'sort': 'voting'
    };
    HomeRepository().getHomeData(data).then((value) {
      print(value['result']);
      setState(() {
        dataList.addAll(value['result']);
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    callHomeData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "Home",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: const Drawer(
          child: DrawerPage(),
        ),
        body: isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 80,
                              child: Column(
                                children: [
                                  Icon(Icons.arrow_drop_up,
                                      size: 50, color: Colors.black54),
                                  Text(dataList[index]['totalVoted'].toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  Icon(Icons.arrow_drop_down,
                                      size: 50, color: Colors.black54),
                                  Text('Voted',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ],
                              ),
                            ),
                            Container(
                              height: 150,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(dataList[index]['poster']))),
                            ),
                            Expanded(
                                child: Container(
                              height: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: Get.width / 2,
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          dataList[index]['title'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  Container(
                                      width: Get.width / 2,
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        dataList[index]['description'],
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(dataList[index]['pageViews'].toString()+' Views |',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 12)),
                                    
                                      Text("Voted By"+dataList[index]['voted'].length.toString()+' People',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 12)),
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        )),
                   
                   Padding(
                     padding: const EdgeInsets.only(top:10,left:10,right:10),
                     child: Container(
                       height:50,
                       width: Get.width/1,
                       color: Colors.blue,
                       alignment: Alignment.center,
                       child:Text("Watch Trailer",style:TextStyle(color:Colors.white,fontSize:16,))
                     ),
                   )
                   
                      ],
                    ),
                  );
                }));
  }
}
