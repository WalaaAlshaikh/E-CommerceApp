import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controller/authController.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_text_field.dart';
import '../../widgets/auth/button.dart';
import '../../widgets/auth/check.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.27,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomText(
                                text: "LOG",
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                                color: Get.isDarkMode ? mainColor : pinkClr),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(
                                text: "IN",
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return "Invalid Email";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Image.asset(
                            "assets/images/email.png",
                            color: mainColor,
                          ),
                          suffixIcon: const Text(""),
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormField(
                            controller: passwordController,
                            obscureText: controller.isVisible ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should be longer than 6 characters';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Image.asset(
                              "assets/images/lock.png",
                              color: mainColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visible();
                              },
                              icon: controller.isVisible
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black54,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black54,
                                    ),
                            ),
                            hintText: 'Password',
                          );
                        }),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgotPassScreen);
                              },
                              child: CustomText(
                                  text: "Forgot password?",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: "LOG IN",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passwordController.text;

                                controller.loginFirebase(
                                    email: email, password: password);
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                            text: "OR",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset("assets/images/facebook.png"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          GetBuilder<AuthController>(builder: (_){
                            return InkWell(
                                onTap: () {
                                  controller.googleFirebase();

                                },
                                child: Image.asset("assets/images/google.png"));

                          })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Don't have an account?",
                onPressed: () {
                  Get.offNamed(Routes.registerScreen);
                },
                textType: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
