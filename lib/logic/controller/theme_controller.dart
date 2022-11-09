import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController{
  final GetStorage box=GetStorage();
  final key= "isDark";
// to save the state of dark mode
  saveThemeDataInBox(bool isDark){
    box.write(key, isDark);
  }

  bool getThemeDataFromBox(){
    return box.read<bool>(key) ?? false;

  }

  ThemeMode get themeData =>
    getThemeDataFromBox()? ThemeMode.dark : ThemeMode.light;



  void changeTheme(){

    // to switch between the light and dark

    //to change the dark/ light mode in the app

    // it will not change until we change it in background color in scafold

    Get.changeThemeMode(getThemeDataFromBox()
        ? ThemeMode.light :ThemeMode.dark );

    saveThemeDataInBox(!getThemeDataFromBox());


  }

}