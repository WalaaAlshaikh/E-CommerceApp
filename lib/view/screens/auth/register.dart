import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';

import '../../widgets/auth/auth_text_field.dart';
import '../../widgets/auth/button.dart';
import '../../widgets/auth/check.dart';
import '../../widgets/auth/container_under.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController =TextEditingController();
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
   RegisterScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width:double.infinity,
                  height: MediaQuery.of(context).size.height / 1.4,
                  child:Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          CustomText(
                              text: "SIGN",
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: mainColor),
                          SizedBox(width: 5,),
                          CustomText(
                              text: "UP",
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.black),
                        ],
                      ),
                      const SizedBox(height: 50,),
                      AuthTextFormField(
                        controller: nameController,
                        obscureText: false,
                        validator: (){},
                        prefixIcon: Image.asset("assets/images/user.png",color: mainColor,),
                        suffixIcon: const Text(""),
                        hintText: 'Username',

                      ),
                      const SizedBox(height: 20,),
                      AuthTextFormField(
                        controller: emailController,
                        obscureText: false,
                        validator: (){},
                        prefixIcon: Image.asset("assets/images/email.png",color: mainColor,),
                        suffixIcon: const Text(""),
                        hintText: 'Email',

                      ),
                      const SizedBox(height: 20,),
                      AuthTextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (){},
                        prefixIcon: Image.asset("assets/images/lock.png",color: mainColor,),
                        suffixIcon: const Text(""),
                        hintText: 'Password',

                      ),
                      const SizedBox(height:50 ,),
                      CheckWidget(),
                      const SizedBox(height: 40,),
                      AuthButton(text: "REGISTER",onPressed: (){},),
                    ],
                  ),),),
                ContainerUnder(
                  text: "Already have an account?", onPressed: () {  }, textType: 'Login',),
              ],
            ),
          ),


        ),);
  }
}
