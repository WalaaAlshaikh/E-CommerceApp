import 'package:ecommerc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
      elevation: 0,
          actions: [
            IconButton(onPressed: (){},
                icon: Image.asset("assets/images/shop.png"))
          ],
          backgroundColor: Get.isDarkMode? mainColor :darkGreyClr,
          title: const Text("Shoe Mart",),
      centerTitle: true,),
      backgroundColor: Get.isDarkMode? Colors.white :darkGreyClr,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        backgroundColor: Get.isDarkMode ? Colors.white: darkGreyClr,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
                Icons.home,
                color: Get.isDarkMode? mainColor:mainColor),
              icon:  Icon(
                Icons.home,
                color: Get.isDarkMode?Colors.black :Colors.white,),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode? mainColor:mainColor),
              icon:  Icon(
                Icons.category,
                color: Get.isDarkMode? Colors.black :Colors.white),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode? mainColor:mainColor),
              icon:  Icon(
                Icons.favorite,
                color: Get.isDarkMode? Colors.black :Colors.white),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode? mainColor:mainColor),
              icon:  Icon(
                Icons.settings,
                color: Get.isDarkMode? Colors.black :Colors.white),
              label: ""),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          

        },

      ),





    ));
  }
}
