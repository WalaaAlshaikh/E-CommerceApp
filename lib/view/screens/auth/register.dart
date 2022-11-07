import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';

import '../../widgets/auth/auth_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                  height: MediaQuery.of(context).size.height / 1.3,
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
                      AuthTextFormField()


                    ],
                  ),),),
              ],
            ),
          ),


        ),);
  }
}
