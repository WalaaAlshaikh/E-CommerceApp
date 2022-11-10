
import 'package:ecommerc/logic/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings{
  @override
  // each controller has binding
  void dependencies() {
    Get.put(ProductController());
  }


}