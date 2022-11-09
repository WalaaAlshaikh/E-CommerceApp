import 'package:ecommerc/logic/controller/theme_controller.dart';
import 'package:ecommerc/routes/routes.dart';
import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      initialRoute: FirebaseAuth.instance.currentUser != null
          || GetStorage().read<bool>("auth")== true ? AppRoutes.mainScreen :AppRoutes.welcome ,
      themeMode: ThemeController().themeData,
      getPages: AppRoutes.routes,
    );
  }
}


