import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;
  const ContainerUnder({
    required this.text,
    required this.onPressed,
    required this.textType,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20,),
            topRight: Radius.circular(20))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CustomText(text: text, fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        TextButton(onPressed: onPressed,
            child: CustomText(text: textType, fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,textDecoration: TextDecoration.underline,),)

      ],),
    );
  }
}
