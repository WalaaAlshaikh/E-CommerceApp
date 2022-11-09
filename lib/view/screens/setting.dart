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
          // to switch between the light and dark
          Get.isDarkMode
          //to change the dark/ light mode in the app
              ? Get.changeThemeMode(ThemeMode.light)
              : Get.changeThemeMode(ThemeMode.dark);
          // it will not change until we change it in background color in scafold
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
