import 'package:ecommerc/logic/controller/authController.dart';
import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/auth/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_text_field.dart';

class ForgetPass extends StatelessWidget {
  final formKey=GlobalKey<FormState>();
  final TextEditingController emailController =TextEditingController();
   ForgetPass({Key? key}) : super(key: key);
   final controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(backgroundColor: Get.isDarkMode ? Colors.white :Colors.black ,
      centerTitle: true,
      elevation: 0,
      title: Text('Forgot Password' ,style: TextStyle(
        color: Get.isDarkMode? mainColor : Colors.white
      ),
      ),
        leading: IconButton(
          onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back),
        ) ,
      ),
      backgroundColor: Get.isDarkMode? Colors.white : darkGreyClr,
      body: Form(
        key: formKey, child:  SingleChildScrollView(
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(onPressed: (){
                  Get.back();
                },
                icon: Icon(Icons.close_rounded, color: Colors.white,),),
              ),
              const SizedBox(height: 20,),
              Text("If you want to recover your account, then please provide your email below ..",
                textAlign: TextAlign.center,
                style:TextStyle(color:  Get.isDarkMode ?Colors.black : Colors.white) ,),
              const SizedBox(height: 50,),
              Image.asset("assets/images/forgetpass copy.png" ,width: 250, ),
              const SizedBox(height: 50,),

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
              const SizedBox(height: 50,),

              GetBuilder<AuthController>(builder: (_){

                return AuthButton(text: "Reset Password", onPressed: (){

                  if (formKey.currentState!.validate()) {
                    String email = emailController.text.trim();
                    controller.resetPass(email);
                  }

                });
              })



              

            ],
          ),
        ),
      ),
      ),
    ));
  }
}
