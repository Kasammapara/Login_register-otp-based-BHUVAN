import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final keyboardType;
  final String hintText;
  final bool obscureText;
  final errorText;

  const MyTextField({super.key, this.controller, required this.hintText, required this.obscureText, this.keyboardType, this.errorText});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 60,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType:keyboardType ,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            errorText: errorText,
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              fillColor:const Color.fromRGBO(34, 34, 34, 1),
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(15.0),
              )
          ),
        ),
      ),
    );
  }
}
