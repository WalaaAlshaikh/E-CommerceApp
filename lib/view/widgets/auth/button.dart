import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({
    required this.text,
    required this.onPressed,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
              minimumSize: const Size(360, 50),
        ),
        onPressed: onPressed,
        child:  CustomText(
            text: text,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white));
  }
}
