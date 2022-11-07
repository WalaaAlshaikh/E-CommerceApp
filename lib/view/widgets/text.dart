import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const CustomText({required this.text,required this.fontWeight, required this.fontSize,Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.white,
          fontSize:fontSize,
          fontWeight: fontWeight),

    );
  }
}
