import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/authController.dart';
import '../../../logic/controller/setting_controller.dart';


class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
              () => Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      authController.displayUserPic.value,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text: controller
                        .capitalize(authController.displayName.value),
                    color: Get.isDarkMode ? Colors.white : Colors.black,

                  ),
                  CustomText(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    text: authController.displayUserEmail.value,
                    color: Get.isDarkMode ? Colors.white : Colors.black,

                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}