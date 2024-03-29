import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_double_bullet/bottom_bar_double_bullet.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sif/components/button.dart';

import '../../components/appbar.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int selectedIndex = 0;
  Map<String, bool> userApprovalStatus = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(66, 66, 66, 1),
        bottomNavigationBar: BottomBarBubble(
          selectedIndex: selectedIndex,
          height: 60,
          color: Colors.white,
          backgroundColor: Colors.black54,
          items: [
            BottomBarItem(
              iconData: Icons.home,
              // label: 'Home',
            ),
            BottomBarItem(
              iconData: Icons.check,
              // label: 'Chat',
            ),
            BottomBarItem(
              iconData: Icons.close,
              // label: 'Notification',
            ),
            BottomBarItem(
              iconData: Icons.history,
              // label: 'Notification',
            )
          ],
          onSelect: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: appbar(),
        ),
        body:

        IndexedStack(
          index: selectedIndex,
          children: [
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ListTile(
                                tileColor: Colors.transparent,
                                leading: CircleAvatar(
                                  child: Icon(Icons.account_circle_rounded),
                                ),
                                title: Text(
                                  "${snapshot.data?.docs![index]["NameAndDesignation"]}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  "${snapshot.data?.docs![index]["PhoneNumber"]}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: SizedBox(
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (snapshot.data?.docs![index]["approved"] != "false")
                                      Expanded(
                                        child: snapshot.data?.docs![index]["approved"] == "true"
                                            ? Icon(
                                          Icons.check_circle,size:30,
                                          color: Colors.green,
                                        )
                                            : IconButton(
                                          icon: Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(snapshot.data?.docs![index].id).update({
                                              'approved': "true",
                                            }).then((_) {
                                              print(
                                                  'User approved successfully');
                                            }).catchError((error) {
                                              print(
                                                  'Error approving user: $error');
                                            });
                                          },
                                        ),
                                      ),
                                      if (snapshot.data?.docs![index]["approved"] != "true")
                                      Expanded(
                                        child: snapshot.data?.docs![index]["approved"] == "false"
                                            ? Icon(
                                          Icons.cancel,size:30,
                                          color: Colors.red,
                                        )
                                            : IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(snapshot.data?.docs![index].id).update({
                                              'approved':"false",
                                            }).then((_) {
                                              print(
                                                  'User declined successfully');
                                            }).catchError((error) {
                                              print(
                                                  'Error approving user: $error');
                                            });
                                          },
                                        ),
                                      ),
                                    ],

                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data?.docs.length,
                      );
                    } else if (snapshot.hasError) {
                      return Text("Errer");
                    } else {
                      return Text("Hello");
                    }
                  } else {
                    return Text("data");
                  }
                }),
            StreamBuilder(
                stream:
                FirebaseFirestore.instance.collection("users").where('approved', isEqualTo: "true").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ListTile(
                                tileColor: Colors.transparent,
                                leading: CircleAvatar(
                                  child: Icon(Icons.account_circle_rounded),
                                ),
                                title: Text(
                                  "${snapshot.data?.docs![index]["NameAndDesignation"]}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  "${snapshot.data?.docs![index]["PhoneNumber"]}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data?.docs.length,
                      );
                    } else if (snapshot.hasError) {
                      return Text("Errer");
                    } else {
                      return Text("Hello");
                    }
                  } else {
                    return Text("data");
                  }
                }),
            StreamBuilder(
                stream:
                FirebaseFirestore.instance.collection("users").where('approved', isEqualTo: "false").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ListTile(
                                tileColor: Colors.transparent,
                                leading: CircleAvatar(
                                  child: Icon(Icons.account_circle_rounded),
                                ),
                                title: Text(
                                  "${snapshot.data?.docs![index]["NameAndDesignation"]}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  "${snapshot.data?.docs![index]["PhoneNumber"]}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data?.docs.length,
                      );
                    } else if (snapshot.hasError) {
                      return Text("Errer");
                    } else {
                      return Text("Hello");
                    }
                  } else {
                    return Text("data");
                  }
                }),
          ],
        ));
  }
}
