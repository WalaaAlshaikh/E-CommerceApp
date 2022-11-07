import 'package:ecommerc/logic/binding/authBinding.dart';
import 'package:ecommerc/view/screens/auth/forgot_password.dart';
import 'package:ecommerc/view/screens/auth/login.dart';
import 'package:ecommerc/view/screens/auth/register.dart';
import 'package:get/get.dart';
import '../view/screens/welcome.dart';

class AppRoutes{

  //initialRoute
  static const welcome =Routes.welcomeScreen;
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
  ];
}

class Routes{
  static const welcomeScreen= "/welcomeScreen";
  static const loginScreen= "/loginScreen";
   static const registerScreen= "/registerScreen";
  static const forgotPassScreen= "/forgotPassScreen";
  // static const welcomeScreen= "/welcomeScreen";

}