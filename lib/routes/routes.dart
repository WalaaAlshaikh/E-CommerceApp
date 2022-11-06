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
    )
  ];
}

class Routes{
  static const welcomeScreen= "/welcomeScreen";
  static const loginScreen= "/loginScreen";
  // static const welcomeScreen= "/welcomeScreen";
  // static const welcomeScreen= "/welcomeScreen";
  // static const welcomeScreen= "/welcomeScreen";

}