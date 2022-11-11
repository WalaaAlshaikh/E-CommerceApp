import 'package:ecommerc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/cart_controller.dart';
import '../widgets/cart/cart_product.dart';
import '../widgets/cart/empty_cart.dart';
import '../widgets/cart/total_cart.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text("Cart Items"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr :mainColor,
          actions: [
            IconButton(onPressed: (){
              controller.clearAllProduct();
            }, icon: Icon(Icons.backspace)),
        ],
      ),
      body:Obx((){

        if(controller.productsMap.isEmpty){
          return EmptyCard();
        } else {
        return  SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 500,
                child: ListView.separated(
                    itemBuilder: (context,index){
                      return CardProduct(
                        index: index,
                        productModel: controller.productsMap.keys.toList()[index],
                        quantity: controller.productsMap.values.toList()[index],
                      );
                    },
                    separatorBuilder: (context,index) => const SizedBox(
                      height: 20,
                    ),
                    itemCount: controller.productsMap.length),),
              Padding(padding: EdgeInsets.only(bottom: 30),
                child:CartTotal(),)




            ],
          ),
        );}
      })
    ));
  }
}
