import 'package:get/get.dart';

class AuthController extends GetxController{
  bool isVisible= false;
  bool isCheckbox=false;

  void visible(){
    isVisible= !isVisible;
    update();
  }

  void checkBox(){
    isCheckbox=!isCheckbox;
    update();
  }

}

