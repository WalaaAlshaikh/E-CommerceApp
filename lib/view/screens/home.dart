import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home/card_item.dart';
import '../widgets/home/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
          width: double.infinity,
          height: 180,
          decoration:  BoxDecoration(
            color: Get.isDarkMode? darkGreyClr :mainColor ,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
          ),
            child:Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: "Find Your",
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      color: Colors.white),
                  const SizedBox(height: 5,),
                  CustomText(
                      text: "INSPIRATION",
                      fontWeight: FontWeight.normal,
                      fontSize: 28,
                      color: Colors.white),
                  const SizedBox(height: 18,),
                  SearchFormText(),
                ],
              ),
            ) ,

        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: CustomText(
                text: "Categories",
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Get.isDarkMode? Colors.white :Colors.black),
          ),
        ),
          const SizedBox(height: 20,),
          CardItem(),


        ],

      ),

    ));
  }
}
