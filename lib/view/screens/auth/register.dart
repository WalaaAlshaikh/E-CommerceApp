import 'package:ecommerc/logic/controller/authController.dart';
import 'package:ecommerc/utils/my_string.dart';
import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../routes/routes.dart';
import '../../widgets/auth/auth_text_field.dart';
import '../../widgets/auth/button.dart';
import '../../widgets/auth/check.dart';
import '../../widgets/auth/container_under.dart';

class RegisterScreen extends StatelessWidget {
  final formKey=GlobalKey<FormState>();
  final TextEditingController nameController =TextEditingController();
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  final controller= Get.find<AuthController>();
   RegisterScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor:Get.isDarkMode? darkGreyClr: Colors.white ,
            elevation: 0,
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width:double.infinity,
                  height: MediaQuery.of(context).size.height / 1.27,
                  child:Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Form(
                    key:formKey ,
                    child: Column(
                      children: [
                        Row(
                          children:  [
                            CustomText(
                                text: "SIGN",
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                                color: Get.isDarkMode ?mainColor : mainColor),
                            SizedBox(width: 5,),
                            CustomText(
                                text: "UP",
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                                color: Get.isDarkMode ?Colors.white: Colors.black),
                          ],
                        ),
                        const SizedBox(height: 50,),
                        AuthTextFormField(
                          controller: nameController,
                          obscureText: false,
                          validator: (value){

                            if(value.toString().length<=2 || !RegExp(validationName).hasMatch(value)){
                              return "Enter valid Username";
                            } else{
                              return null;
                            }


                          },
                          prefixIcon: Image.asset("assets/images/user.png",color: mainColor,),
                          suffixIcon: const Text(""),
                          hintText: 'Username',

                        ),
                        const SizedBox(height: 20,),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value){
                            if( !RegExp(validationEmail).hasMatch(value)){
                              return "Invalid Email";
                            } else{
                              return null;
                            }
                          },
                          prefixIcon: Image.asset("assets/images/email.png",color: mainColor,),
                          suffixIcon: const Text(""),
                          hintText: 'Email',

                        ),
                        const SizedBox(height: 20,),
                        GetBuilder<AuthController>(
                            builder:(_) {
                              return AuthTextFormField(
                                controller: passwordController,
                                obscureText: controller.isVisible ?false : true,
                                validator: (value){
                                  if(value.toString().length <6){
                                    return 'Password should be longer than 6 characters';
                                  }else{
                                    return null ;
                                  }
                                },
                                prefixIcon: Image.asset("assets/images/lock.png",color: mainColor,),
                                suffixIcon: IconButton(onPressed: (){
                                  controller.visible();


                                },icon: controller.isVisible? const Icon(Icons.visibility_off , color: Colors.black54,)
                                  : const Icon(Icons.visibility, color: Colors.black54,),),
                                hintText: 'Password',

                              );
                            } ),
                        const SizedBox(height:50 ,),
                        CheckWidget(),
                        const SizedBox(height: 40,),
                       GetBuilder<AuthController>(builder: (_){
                         return  AuthButton(
                           text: "REGISTER",
                           onPressed: () {
                             if(controller.isCheckbox==false){
                               Get.snackbar("Check Box", "Please, Accepts the terms & conditions",
                                   snackPosition:SnackPosition.BOTTOM,
                                   backgroundColor: Colors.grey,
                                   colorText: Colors.white);
                             }

                             else if(formKey.currentState!.validate()){

                               String name=nameController.text.trim();
                               String email=emailController.text.trim();
                               String password=passwordController.text;
                               controller.registerFirebase(
                                   name: name,
                                   email: email,
                                   password: password);

                               controller.isCheckbox==true;

                             }

                         }
                         ,);
                       })
                      ],
                    ),
                  ),),),
                ContainerUnder(
                  text: "Already have an account?", onPressed: () {
                    Get.offNamed(Routes.loginScreen);
                }, textType: 'Login',),
              ],
            ),
          ),


        ),);
  }
}
