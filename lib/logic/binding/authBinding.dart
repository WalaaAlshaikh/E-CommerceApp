import 'package:ecommerc/logic/controller/authController.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings{
  @override
  // each controller has binding
  void dependencies() {
   Get.put(AuthController());
  }


}