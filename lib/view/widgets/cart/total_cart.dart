import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  const CartTotal ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Total",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey),
              Text("\$5690.33", style: TextStyle(
                color: Get.isDarkMode ? Colors.white:Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,height: 1.5
              ),)
            ],
          ),
          const SizedBox(width: 20,),
          Expanded(
              child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),elevation: 0,
                        backgroundColor: Get.isDarkMode ? mainColor:mainColor,
                      ) ,
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Check Out" ,style: TextStyle(fontSize: 20, color: Colors.white),),
                          SizedBox(width: 10,),
                          Icon(Icons.shopping_cart)
                        ],
                      ))))


        ],
      ),
    );
  }
}
