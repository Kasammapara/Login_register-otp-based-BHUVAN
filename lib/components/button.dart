import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const MyButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color:Color.fromRGBO(34, 34, 34, 1),
            borderRadius: BorderRadius.circular(10)
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
            child: Text(text
            ,style: TextStyle(color: Color.fromRGBO(239, 242, 42, 1),fontWeight: FontWeight.bold,),
            ),
          ),
        ),
      ),
    );
  }
}
