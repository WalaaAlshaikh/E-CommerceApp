import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.backgroundColor,

      body:
      // Center(
      //   child:Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SizedBox(height: 100,width: 100,
      //       child: Image.asset("assets/images/heart.png"),),
      //       SizedBox(height: 20),
      //         Text("Please,Add your favourite products",
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           color: Get.isDarkMode? Colors.white :Colors.black54,
      //           fontSize: 18
      //         ),),
      //
      //     ],
      //   ) ,)
      ListView.separated(
          itemBuilder: (context,index){
            return buildFavItem();

          },
          separatorBuilder: (context,index){
            return Divider(
              color: Colors.grey,
              thickness: 1,
            );

          },
          itemCount: 10) ,

    );
  }

  Widget buildFavItem(){

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
              child: Image.network("https://i.etsystatic.com/11771780/r/il/98b5a5/924555576/il_570xN.924555576_rhom.jpg",
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
                Text("title titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                  style: TextStyle(overflow: TextOverflow.ellipsis,color: Get.isDarkMode ?Colors.white:Colors.black,
                fontWeight: FontWeight.bold,fontSize: 16 ),),
                const SizedBox(height: 10,),
                Text("\$ 100",
                  style: TextStyle(overflow: TextOverflow.ellipsis,color: Get.isDarkMode ?Colors.white:Colors.black,
                      fontWeight: FontWeight.bold,fontSize: 16 ),)
              ],
            ),
          ),
          const Spacer(),

          IconButton(onPressed: (){},
              icon: Icon(Icons.favorite,color: Colors.red, size: 30,))
        ],
      ),
    ),
    );
  }
}
