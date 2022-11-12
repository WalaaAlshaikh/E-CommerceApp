import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/setting/dark_mode.dart';
import '../widgets/setting/language.dart';
import '../widgets/setting/logout.dart';
import '../widgets/setting/profile.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Profile(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomText(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: "GENERAL".tr,
            color: Get.isDarkMode ? mainColor : mainColor,

          ),
          const SizedBox(
            height: 20,
          ),
          DarkMode(),
          const SizedBox(
            height: 20,
          ),
          Language(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}