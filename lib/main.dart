import 'package:ecommerc/view/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
      initialRoute: "/welcomeScreen",
      getPages: [
        GetPage(name: "/welcomeScreen", page: ()=> const WelcomeScreen(),
        )
      ],
    );
  }
}


