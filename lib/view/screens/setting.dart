import 'package:ecommerc/logic/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/authController.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
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
            const SizedBox(height: 10,),

            GetBuilder<AuthController>(
              builder: (controller){
                return TextButton(
                  onPressed: () {
                    controller.signOut();
                  },
                  child: Text(
                    'Log out',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white :Colors.black
                    )
                    ,),
                );

              },

            ),
          ],
        ),
      ),


    );
  }
}
