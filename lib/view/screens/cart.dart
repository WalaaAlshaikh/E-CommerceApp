import 'package:ecommerc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart/cart_product.dart';
import '../widgets/cart/empty_cart.dart';
import '../widgets/cart/total_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

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
            IconButton(onPressed: (){}, icon: Icon(Icons.backspace)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 500,
            child: ListView.separated(
                itemBuilder: (context,index){
                  return CardProduct();
                },
                separatorBuilder: (context,index) => const SizedBox(
                  height: 20,
                ),
                itemCount: 1),),
            Padding(padding: EdgeInsets.only(bottom: 30),
              child:CartTotal(),)




          ],
        ),
      ),
    ));
  }
}
