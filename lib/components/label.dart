import 'package:flutter/material.dart';

class Mylabel extends StatelessWidget {
  final String label_text;

  const Mylabel ({super.key, required this.label_text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const SizedBox(width: 35,),
        Container(
          child:  Text(
           '${label_text}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
