import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CardProduct extends StatelessWidget {
  const CardProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20,right: 20,top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? mainColor.withOpacity(0.5): mainColor.withOpacity(0.5) ,
        borderRadius: BorderRadius.circular(20),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height:120 ,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: NetworkImage("https://images.squarespace-cdn.com/content/v1/54d3e565e4b01a0da312fdd6/1615244139727-R5WCGRUFOJTXZLKDGL8R/Boston+Harbor+Art_NK+boston+artwork.jpg"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(width: 20,),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             Text( "Flutter Developer fervdv Flutter Developer fervdv Flutter Developer fervdv ",
                 style: TextStyle(
                     overflow: TextOverflow.ellipsis,
                     fontWeight: FontWeight.bold,
                     fontSize: 14,
                     color:Get.isDarkMode? Colors.white: Colors.black)),
                const SizedBox(height: 15,),
                Text( "\$ 100 ",style:
                TextStyle( overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color:Get.isDarkMode? Colors.white: Colors.black))
            ],),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle,
                    color:Get.isDarkMode ? Colors.white:Colors.black )),
                Text("1",style:
                TextStyle( overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color:Colors.black),),
                IconButton(onPressed: (){},
                    icon: Icon(Icons.add_circle, color:Get.isDarkMode ? Colors.white:Colors.black ,)),
              ],),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete,size: 20,
              color: Get.isDarkMode? Colors.white: Colors.black,))
            ],
          ),

        ],
      ),
    );
  }
}
