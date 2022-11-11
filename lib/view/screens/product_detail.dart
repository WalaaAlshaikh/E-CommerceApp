import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../model/productModel.dart';
import '../widgets/p_details/clothes_info.dart';
import '../widgets/p_details/image_slider.dart';
import '../widgets/p_details/size.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetails({required this.productModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: productModel.image,
              ),
              ClothesInfo(
                title: productModel.title,
                productId: productModel.id,
                rate: productModel.rating.rate,
                description: productModel.description,
              ),
              const SizeList(),
              // AddCart(
              //   price: productModel.price,
              //   productModels: productModel,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}