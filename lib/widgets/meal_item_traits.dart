import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MealItemTraits extends StatelessWidget {
  const MealItemTraits({super.key, required this.icon,required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Colors.white,size: 20),
        SizedBox(width: 6),
        Text(text,style: TextStyle(color: Colors.white),)
      ],
    );
  }

}


// This Class Will take Two Parameter As Arguments One Is For ICon And Another Is For Text.