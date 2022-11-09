import 'package:ecommerc/logic/controller/main_controller.dart';
import 'package:ecommerc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);

   final controller =Get.find<MainController>();

   //we need stream (obx) because in this page it retrieve data from api and transferring the data between each page

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(()=>
        Scaffold(

          // this will enable the theme in backgroundColor // it will not change until we go to main.dart
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(onPressed: (){

                
              },
                  icon: Image.asset("assets/images/shop.png"))
            ],


            backgroundColor: Get.isDarkMode? darkGreyClr :mainColor,
            // here the title will change based on the taps on the nav bar and it change by the current index that we define in controller
            title:  Text(controller.title[controller.currentIndex.value]),
            centerTitle: true,),
          // we disable this because we need to change the mode based on the click on the icon
          // backgroundColor: Get.isDarkMode? Colors.white :darkGreyClr,
          bottomNavigationBar: BottomNavigationBar(
            elevation: 3,
            backgroundColor: Get.isDarkMode ? darkGreyClr: Colors.white,
            currentIndex: controller.currentIndex.value,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Icon(
                      Icons.home,
                      color: Get.isDarkMode? mainColor:mainColor),
                  icon:  Icon(
                    Icons.home,
                    color: Get.isDarkMode?Colors.white :Colors.black,),
                  label: ""),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                      Icons.category,
                      color: Get.isDarkMode? mainColor:mainColor),
                  icon:  Icon(
                      Icons.category,
                      color: Get.isDarkMode? Colors.white :Colors.black),
                  label: ""),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                      Icons.favorite,
                      color: Get.isDarkMode? mainColor:mainColor),
                  icon:  Icon(
                      Icons.favorite,
                      color: Get.isDarkMode? Colors.white :Colors.black),
                  label: ""),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode? mainColor:mainColor),
                  icon:  Icon(
                      Icons.settings,
                      color: Get.isDarkMode? Colors.white :Colors.black),
                  label: ""),
            ],
            type: BottomNavigationBarType.shifting,
            onTap: (index){
              // adding this line because when he click on the items the index also change based on the click
              controller.currentIndex.value=index;
            },
          ),
          // here in the body we need to add the taps but before we need something called
          //(index stack) in state managemnet there are some states can't change like in fav if we ant to change it it can't change

          body:  IndexedStack(
            index: controller.currentIndex.value,
            children: controller.taps,

          ) ,





        )
    ) );
  }
}
