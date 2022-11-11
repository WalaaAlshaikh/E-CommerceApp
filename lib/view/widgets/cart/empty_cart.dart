import 'package:ecommerc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,
          size: 150,
          color:  Get.isDarkMode ?Colors.white:Colors.black54,),
          const SizedBox(height: 20,),
          RichText(text: TextSpan(
              children: [
                TextSpan(text: "Your Cart is ",
                style: TextStyle(color: Get.isDarkMode? Colors.white: Colors.black,
                fontSize: 30, fontWeight: FontWeight.bold)),
                TextSpan(text: "Empty",
                    style: TextStyle(color: Get.isDarkMode? mainColor: mainColor,
                        fontSize: 30, fontWeight: FontWeight.bold)),


          ])),
          const SizedBox(height: 10,),
           Text("Add items to get started", style: TextStyle(color: Get.isDarkMode? Colors.white: Colors.black,
              fontSize: 15, fontWeight: FontWeight.bold),),
          const SizedBox(height: 40,),
          SizedBox(height:50 ,child: ElevatedButton(
              onPressed: (){
            Get.toNamed(Routes.mainScreen);},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ), elevation: 0,
              backgroundColor: Get.isDarkMode? mainColor:mainColor),
          child:  const Text("Go to Home" ,style: TextStyle(color: Colors.white, fontSize: 20),),))

        ],
      ),
    );
  }
}
