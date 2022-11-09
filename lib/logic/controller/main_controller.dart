import 'package:ecommerc/view/screens/category.dart';
import 'package:ecommerc/view/screens/favourite.dart';
import 'package:ecommerc/view/screens/setting.dart';
import 'package:get/get.dart';

import '../../view/screens/home.dart';

class MainController  extends GetxController{
  RxInt currentIndex=0.obs;
// for tapping in bottom navigation bar , we need to put them also in routes binding

  // we need to create binding file for main screen to link the pages together
  final taps=[
    HomeScreen(),
    CategoryScreen(),
    FavScreen(),
    SettingScreen(),
  ].obs;

  //here we need to change the title in the app bar based on the taps in the bottom nav

  final title=[
    "Shoe Mart",
    "Categories",
    "Favourite",
    "Settings",
  ].obs;


}