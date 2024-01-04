import 'package:flutter/material.dart';

class appbar extends StatelessWidget {
  const appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    AppBar(
      leading: Icon(null),
      backgroundColor: const Color.fromRGBO(57, 57, 57, 1),
      flexibleSpace: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin:Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(57, 57, 57, 1),Color.fromRGBO(28, 28, 28, 1),],
              )
          ),
          child: Image.asset('lib/images/bhuvan_header.jpg',
            height:50 ,
          ),
        ),
      ),
      // title: Text("Hello"),

    );



  }
}
