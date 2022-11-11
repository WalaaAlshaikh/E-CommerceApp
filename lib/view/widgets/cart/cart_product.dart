import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/cart_controller.dart';
import '../../../model/productModel.dart';
class CardProduct extends StatelessWidget {
  final ProductModel productModel;
  final int index;
  final int quantity;

   CardProduct({
     required this.productModel,
     required this.index,
     required this.quantity,
     Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20,right: 20,top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? mainColor.withOpacity(0.5): mainColor.withOpacity(0.5) ,
        borderRadius: BorderRadius.circular(20),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height:120 ,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: NetworkImage(productModel.image),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(width: 20,),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             Text( productModel.title,
                 style: TextStyle(
                     overflow: TextOverflow.ellipsis,
                     fontWeight: FontWeight.bold,
                     fontSize: 14,
                     color:Get.isDarkMode? Colors.white: Colors.black)),
                const SizedBox(height: 15,),
                Text( "\$ ${controller.productSubTotal[index].toStringAsFixed(2)} ",style:
                TextStyle( overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color:Get.isDarkMode? Colors.white: Colors.black))
            ],),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(children: [
                IconButton(onPressed: (){

                  controller.removeProductFromCart(productModel);
                }, icon: Icon(Icons.remove_circle,
                    color:Get.isDarkMode ? Colors.white:Colors.black )),
                Text("$quantity",style:
                TextStyle( overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color:Colors.black),),
                IconButton(onPressed: (){

                  controller.addProductToCart(productModel);
                },
                    icon: Icon(Icons.add_circle, color:Get.isDarkMode ? Colors.white:Colors.black ,)),
              ],),
              IconButton(onPressed: (){
                controller.removeOneProduct(productModel);

              }, icon: Icon(Icons.delete,size: 20,
              color: Get.isDarkMode? Colors.white: Colors.red,))
            ],
          ),

        ],
      ),
    );
  }
}
