import 'package:ecommerc/logic/binding/authBinding.dart';
import 'package:ecommerc/view/screens/auth/forgot_password.dart';
import 'package:ecommerc/view/screens/auth/login.dart';
import 'package:ecommerc/view/screens/auth/register.dart';
import 'package:ecommerc/view/screens/main_screen.dart';
import 'package:get/get.dart';
import '../logic/binding/mainBinding.dart';
import '../view/screens/welcome.dart';

class AppRoutes{

  //initialRoute
  static const welcome =Routes.welcomeScreen;
  static const mainScreen =Routes.mainScreen;
  //GetPage

  static final routes= [
    GetPage(
      name: Routes.welcomeScreen,
      page: ()=>  WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: ()=>  LoginScreen(),
      binding: AuthBinding()
    ),
    GetPage(
      name: Routes.registerScreen,
      page: ()=>  RegisterScreen(),
      binding: AuthBinding()
    ),
    GetPage(
        name: Routes.forgotPassScreen,
        page: ()=>  ForgetPass(),
        binding: AuthBinding()
    ),
    GetPage(

      //here we put bindings instead of binding because we need them both controllers main and auth
        name: Routes.mainScreen,
        page: ()=>  MainScreen(),
        bindings: [AuthBinding(),
                  MainBinding()]
    ),
  ];
}

class Routes{
  static const welcomeScreen= "/welcomeScreen";
  static const loginScreen= "/loginScreen";
   static const registerScreen= "/registerScreen";
  static const forgotPassScreen= "/forgotPassScreen";
   static const mainScreen= "/mainScreen";

}