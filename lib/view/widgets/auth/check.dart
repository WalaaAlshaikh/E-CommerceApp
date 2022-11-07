import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){},
          child:Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),

            ),
            child: Image.asset("assets/images/check.png",color: mainColor,),
          ),
        ),
        const SizedBox(width: 13,),
        Row(children:  [
          CustomText(text: "I accept", fontWeight: FontWeight.normal, fontSize: 16, color: Get.isDarkMode? Colors.black54 :Colors.white),
          CustomText(text: " terms & conditions", fontWeight: FontWeight.normal, fontSize: 16, color: Get.isDarkMode? Colors.black54 :Colors.white,textDecoration: TextDecoration.underline,)
        ],)
        
      ],
    );


  }
}
