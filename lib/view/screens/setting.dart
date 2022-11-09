import 'package:ecommerc/logic/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: TextButton(
        onPressed: () {
          ThemeController().changeTheme();
        },
        child: Text(
          'Dark Mode',
          style: TextStyle(
            color: Get.isDarkMode ? Colors.white :Colors.black
          )
          ,),
    ),
      ),


    );
  }
}
