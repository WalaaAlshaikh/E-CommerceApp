import 'package:ecommerc/logic/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavScreen extends StatelessWidget {
   FavScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.backgroundColor,

      body:Obx((){

        if(controller.favtList.isEmpty){
          return
          Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,width: 100,
                child: Image.asset("assets/images/heart.png"),),
                SizedBox(height: 20),
                  Text("Please,Add your favourite products",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode? Colors.white :Colors.black54,
                    fontSize: 18
                  ),),

              ],
            ) ,);
        }else{
          return
          ListView.separated(
              itemBuilder: (context,index){
                return buildFavItem(image: controller.favtList[index].image,
                title: controller.favtList[index].title,
                price: controller.favtList[index].price,
                id: controller.favtList[index].id);

              },
              separatorBuilder: (context,index){
                return Divider(
                  color: Colors.grey,
                  thickness: 1,
                );

              },
              itemCount: controller.favtList.length) ;
        }

      })



    );
  }

  Widget buildFavItem({
  required String image,
    required double price,
    required String title,
    required int id,
}){

    return Padding(
        padding: const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          SizedBox(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: AspectRatio(
                aspectRatio: 1,
              child: Image.network(image,
              fit: BoxFit.cover,)),
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                Text(title,
                  style: TextStyle(overflow: TextOverflow.ellipsis,color: Get.isDarkMode ?Colors.white:Colors.black,
                fontWeight: FontWeight.bold,fontSize: 16 ),),
                const SizedBox(height: 10,),
                Text("\$ $price",
                  style: TextStyle(overflow: TextOverflow.ellipsis,color: Get.isDarkMode ?Colors.white:Colors.black,
                      fontWeight: FontWeight.bold,fontSize: 16 ),)
              ],
            ),
          ),
          const Spacer(),

          IconButton(onPressed: (){
            controller.manageFav(id);
          },
              icon: Icon(Icons.favorite,color: Colors.red, size: 30,))
        ],
      ),
    ),
    );
  }
}
