import 'package:ecommerc/logic/controller/authController.dart';
import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);

  final controller= Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder:(_){
          return Row(
            children: [
              InkWell(
                onTap: (){
                  controller.checkBox();
                },
                child:Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: controller.isCheckbox ? Image.asset("assets/images/check.png",color: mainColor,) : Container(),
                ),
              ),
              const SizedBox(width: 13,),
              Row(children:  [
                CustomText(text: "I accept", fontWeight: FontWeight.normal, fontSize: 16, color: Get.isDarkMode? Colors.white :Colors.black54),
                CustomText(text: " terms & conditions", fontWeight: FontWeight.normal, fontSize: 16, color: Get.isDarkMode? Colors.white :Colors.black54,textDecoration: TextDecoration.underline,)
              ],)

            ],
          );
        } ) ;


  }
}
