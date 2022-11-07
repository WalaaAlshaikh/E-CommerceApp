import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [

          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100,),
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child:CustomText(text: "Welcome",
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    color: Colors.white,),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 60,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CustomText(text: "Walaa's ", fontWeight: FontWeight.w600, fontSize: 30, color: mainColor),
                      SizedBox(width: 6,),
                      CustomText(text: "Shop", fontWeight: FontWeight.w600, fontSize: 30, color:Colors.white ),
                    ],
                  ),
                ),
                const SizedBox(height: 150,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor, 
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(5)
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10,
                    horizontal: 35)
                  ),
                    onPressed: (){},
                    child: const CustomText(
                      text: "Get Start",
                      fontWeight: FontWeight.w600,
                      fontSize: 23,
                      color: Colors.white,),
                ),
                const SizedBox(height: 30,),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [  
                    const CustomText(
                    text: "Don't have an account?",
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Colors.white),
                    TextButton(
                        onPressed: (){},
                        child:const CustomText(
                          text:"Sign Up" ,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        textDecoration: TextDecoration.underline,) )
                 ]),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
