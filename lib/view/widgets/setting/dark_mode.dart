import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/setting_controller.dart';
import '../../../logic/controller/theme_controller.dart';


class DarkMode extends StatelessWidget {
  DarkMode({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
            activeTrackColor: Get.isDarkMode ? mainColor : mainColor,
            activeColor: Get.isDarkMode ? mainColor : mainColor,
            value: controller.swithchValue.value,
            onChanged: (value) {
              ThemeController().changeTheme();
              controller.swithchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          CustomText(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            text: "Dark Mode".tr,
            color: Get.isDarkMode ? Colors.white : Colors.black,

          ),
        ],
      ),
    );
  }
}