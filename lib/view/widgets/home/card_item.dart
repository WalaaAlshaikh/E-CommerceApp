import 'package:ecommerc/logic/controller/cart_controller.dart';
import 'package:ecommerc/logic/controller/product_controller.dart';
import 'package:ecommerc/model/productModel.dart';
import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/product_detail.dart';

class CardItem extends StatelessWidget {
   CardItem({Key? key}) : super(key: key);

  final controller= Get.find<ProductController>();
  final cartController=Get.find<CartController>();


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.isLoading.value){
        return const Center(
          child: CircularProgressIndicator(
            color: mainColor,
          ),
        );
      } else{
        return Expanded(
          child:controller.searchList.isEmpty && controller.searchController.text.isNotEmpty ?
              Get.isDarkMode ?Image.asset("assets/images/search_empty_dark.png"):Image.asset("assets/images/search_empry_light.png")
              :

          GridView.builder(
            itemCount: controller.searchList.isEmpty? controller.productList.length: controller.searchList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6,
                maxCrossAxisExtent: 200
            ),
            itemBuilder: (context,index) {
              if(controller.searchList.isNotEmpty){
                return buildCard(image: controller.searchList[index].image,
                    price:  controller.searchList[index].price,
                    rate:  controller.searchList[index].rating.rate,
                    id: controller.searchList[index].id,
                    productModel: controller.searchList[index],
                    onTap: (){
                      Get.to(()=> ProductDetails(productModel: controller.searchList[index],));
                    });
              }else{
                return buildCard(image: controller.productList[index].image,
                    price:  controller.productList[index].price,
                    rate:  controller.productList[index].rating.rate,
                    id: controller.productList[index].id,
                    productModel: controller.productList[index],
                    onTap: (){
                      Get.to(()=> ProductDetails(productModel: controller.productList[index],));
                    });

              }

            },),
        );
      }

    }
     );
  }

  Widget buildCard(
   { required String image,
   required double price,
   required double rate,
   required int id,
   required ProductModel productModel ,
   required Function() onTap}
      ){

    return  Padding(padding: EdgeInsets.all(5),
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ]

        ) ,
        child: Column(
          children: [
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: (){
                        controller.manageFav(id);

                      },
                      icon: controller.isFav(id)?

                      Icon(Icons.favorite, color: Colors.red,)
                          :Icon(Icons.favorite_outline,color: Colors.black,)

                  ),
                  IconButton(
                      onPressed: (){

                        cartController.addProductToCart(productModel);
                      },
                      icon: const Icon(Icons.shopping_cart ,color: Colors.black,)
                  ),
                ],
              );
            }),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),

              ),
              child: Image.network(image,
                fit:BoxFit.cover ,) ,

            ),
            Padding(
              padding:  EdgeInsets.only(left: 15.0 ,right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text("\$ $price",
                    style: TextStyle(
                        color: Get.isDarkMode ?Colors.black :Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                  Container(
                    height:20 ,
                    width: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 3,right: 2),
                      child:Row(
                        children: [
                          CustomText(
                              text: "$rate",
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white),
                          Icon(Icons.star,size: 13,color: Colors.white,)

                        ],
                      ) ,),
                  )
                ],
              ),
            ),

          ],
        ),

      ),
    )

      );
  }
}
