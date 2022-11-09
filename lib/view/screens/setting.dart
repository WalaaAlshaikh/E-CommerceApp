import 'package:ecommerc/logic/controller/theme_controller.dart';
import 'package:ecommerc/utils/theme.dart';
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
                    Get.defaultDialog(
                      title: 'LogOut',
                      titleStyle: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                      middleText: "Are you sure you want to logout?",
                      middleTextStyle: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),

                      backgroundColor: Colors.white,
                      radius: 10,
                      textCancel: 'No',
                      cancelTextColor: Colors.black,
                      textConfirm: "YES",
                      confirmTextColor: Colors.white,
                      onCancel: (){
                        Get.back();
                      }
                      ,
                      onConfirm: (){
                        controller.signOut();
                      },
                      buttonColor: mainColor


                    );

                    //
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
