import 'package:ecommerc/logic/controller/authController.dart';
import 'package:ecommerc/utils/my_string.dart';
import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          appBar: AppBar(
            backgroundColor:Get.isDarkMode? Colors.white : darkGreyClr,
            elevation: 0,
          ),
          backgroundColor: Get.isDarkMode? Colors.white : darkGreyClr,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width:double.infinity,
                  height: MediaQuery.of(context).size.height / 1.4,
                  child:Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 40),
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
                                color: Get.isDarkMode ?mainColor : pinkClr),
                            SizedBox(width: 5,),
                            CustomText(
                                text: "UP",
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                                color: Get.isDarkMode ?Colors.black: Colors.white),
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
                        AuthButton(text: "REGISTER",onPressed: (){},),
                      ],
                    ),
                  ),),),
                ContainerUnder(
                  text: "Already have an account?", onPressed: () {  }, textType: 'Login',),
              ],
            ),
          ),


        ),);
  }
}
