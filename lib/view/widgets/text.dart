import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration? textDecoration;
   CustomText({required this.text,required this.fontWeight, required this.fontSize,required this.color,this.textDecoration,Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:GoogleFonts.lato(
        textStyle: TextStyle(color: color,
            fontSize:fontSize,
            fontWeight: fontWeight),
        decoration: textDecoration
          ),

    );
  }
}
