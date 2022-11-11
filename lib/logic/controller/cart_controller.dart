import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/productModel.dart';
import '../../routes/routes.dart';
import '../../utils/theme.dart';

class CartController extends GetxController{

  var productsMap={}.obs;
  //the total of one product
  get productSubTotal=> productsMap.entries.map((e) => e.key.price * e.value).toList();

  //enter (e) which is the key and inside this key access the value
  //(resduce) عد تراكمي

  get total => productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value+element).toStringAsFixed(2);


  void addProductToCart(ProductModel productModel){
    if(productsMap.containsKey(productModel)){
      productsMap[productModel]+=1;


    }else{
      productsMap[productModel]=1;


    }

  }

  void removeProductFromCart(ProductModel productModel){
if(productsMap.containsKey(productModel) && productsMap[productModel]==1){
  productsMap.removeWhere((key, value) => key== productModel);
}else{
  productsMap[productModel]-= 1;
}

  }

  void removeOneProduct(ProductModel productModel){

    productsMap.removeWhere((key, value) => key== productModel);
  }

  void clearAllProduct(){

    Get.defaultDialog(
        title: 'Remove All',
        titleStyle: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        middleText: "Are you sure you want to remove all items?",
        middleTextStyle: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),

        backgroundColor: Colors.white,
        radius: 10,
        textCancel: 'No',
        cancelTextColor: Colors.black,
        textConfirm: "YES",
        confirmTextColor: Colors.white,
        onCancel: (){
          Get.toNamed(Routes.cartScreen);
        }
        ,
        onConfirm: (){
          productsMap.clear();
          Get.back();
        },
        buttonColor: mainColor


    );


  }

  int quantity (){
    if(productsMap.isEmpty){
      return 0;
    }else {
    return productsMap.entries.map((e) => e.value).toList().reduce((value, element) => value+element);}
  }





}