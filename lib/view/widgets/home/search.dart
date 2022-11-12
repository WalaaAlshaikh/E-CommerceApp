import 'package:ecommerc/logic/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget {
   SearchFormText({Key? key}) : super(key: key);

   final controller=Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_)=> TextField(
      controller: controller.searchController,

      cursorColor: Get.isDarkMode? Colors.white: Colors.black,
      keyboardType: TextInputType.text,
      onChanged: (searchName){
        print(searchName);
      },
      decoration:  InputDecoration(
        fillColor: Get.isDarkMode ? Colors.black: Colors.white,
        focusColor: Colors.red,
        prefixIcon: const Icon(Icons.search, color: Colors.grey,),
        suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.close, color: Get.isDarkMode? Colors.white: Colors.black,),),
        hintText: "Search with name or price",
        hintStyle: const TextStyle(color: Colors.black45, fontSize: 16,fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
      ),

    ));
  }
}
