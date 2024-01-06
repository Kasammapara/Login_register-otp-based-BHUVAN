//import 'dart:html';

import 'package:flutter/material.dart';
//import '../components/appbar.dart';
import '../components/Drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var height, width;

  List imgData = [
    "lib/images/FASAL.jpeg",
    "lib/images/MGR.jpeg",
    "lib/images/HFA.jpeg",
    "lib/images/AQUI.jpeg",
    "lib/images/CROP_MONITOR.jpeg",
  ];

  List titles = [
    "FASAL",
    "Geo-MGNREGA",
    "Construction Status",
    "Bhuvan Aquifier",
    "Crop Monitoring",
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromRGBO(249, 247, 247, 1),
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('Navigation drawre'),
          actions: [
            IconButton(
              icon: Icon(Icons.mic),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.indigoAccent,
            //height: height,
            width: width,
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                ),
                height: height * 0.25,
                width: width,
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 246, 246, 248),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  //height: height,
                  width: width,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 25,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: imgData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // Navigate to the desired page
                          //Navigator.pushNamed(context, '/page${index + 1}');
                        },
                        child: Container(
                          margin:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                )
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                imgData[index],
                                width: 100,
                              ),
                              Text(
                                titles[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
