import 'package:ecommerc/logic/controller/main_controller.dart';
import 'package:get/get.dart';

import '../controller/setting_controller.dart';

class MainBinding extends Bindings{
  @override
  // each controller has binding
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
  }


}