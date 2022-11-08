import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class AuthController extends GetxController{
  bool isVisible= false;
  bool isCheckbox=false;
  var displayName="";

  var auth = FirebaseAuth.instance;

  void visible(){
    isVisible= !isVisible;
    update();
  }

  void checkBox(){
    isCheckbox=!isCheckbox;
    update();
  }

  void registerFirebase(
  { required String name,
    required String email,
    required String password,
  }) async{

    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value)  {
        displayName=name;
        auth.currentUser!.updateDisplayName(name);

      }
      );
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {

      String title= e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message='';
      if (e.code == 'weak-password') {
        message="The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        message='The account already exists for that email.';
      }else{
        message=e.message.toString();
      }

      Get.snackbar(
          title,
          message,
          snackPosition:SnackPosition.BOTTOM,
      backgroundColor: Colors.grey,
      colorText: Colors.white);
    } catch (e) {
      Get.snackbar(
          "Error!",
          e.toString(),
          snackPosition:SnackPosition.BOTTOM,
          backgroundColor: Colors.grey,
          colorText: Colors.white);
    }
  }
  void loginFirebase({

  required String email,
    required String password,
}) async{
    try {
     await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) =>
     displayName=auth.currentUser!.displayName!);
     update();
     Get.offNamed(Routes.mainScreen);

    } on FirebaseAuthException catch (e) {
      String title= e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message='';
      if (e.code == 'user-not-found') {
        message="No user found for that $email";
      } else if (e.code == 'wrong-password') {
        message='Wrong password provided for that user.';
      }else{
        message=e.message.toString();
      }

      Get.snackbar(
          title,
          message,
          snackPosition:SnackPosition.BOTTOM,
          backgroundColor: Colors.grey,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar(
          "Error!",
          e.toString(),
          snackPosition:SnackPosition.BOTTOM,
          backgroundColor: Colors.grey,
          colorText: Colors.white);
    }

  }
  void googleFirebase(){}
  void facebookFirebase(){}
  void resetPass(){}
  void signOut(){}


}

