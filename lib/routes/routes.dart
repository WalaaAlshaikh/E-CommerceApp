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
      page: ()=> const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: ()=> const LoginScreen(),
    ),
    GetPage(
      name: Routes.registerScreen,
      page: ()=> const RegisterScreen(),
    ),
  ];
}

class Routes{
  static const welcomeScreen= "/welcomeScreen";
  static const loginScreen= "/loginScreen";
   static const registerScreen= "/registerScreen";
  // static const welcomeScreen= "/welcomeScreen";
  // static const welcomeScreen= "/welcomeScreen";

}