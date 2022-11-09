import 'package:ecommerc/utils/theme.dart';
import 'package:ecommerc/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.8,
          mainAxisSpacing: 9.0,
          crossAxisSpacing: 6,
          maxCrossAxisExtent: 200
        ),
        itemBuilder: (context,index) {
          return buildCard();
        },),
    );
  }

  Widget buildCard(){
    return  Padding(padding: EdgeInsets.all(5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          )
        ]
        
      ) ,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.favorite_outline)
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.add_outlined)
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),

            ),
            child: Image.network("https://img.theculturetrip.com/450x/smart/wp-content/uploads/2012/01/hokusai.jpg",
              fit:BoxFit.cover ,) ,

          ),
          Padding(
            padding:  EdgeInsets.only(left: 15.0 ,right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("\$ 14",
                  style: TextStyle(
                      color: Get.isDarkMode ?Colors.white :Colors.black,
                      fontWeight: FontWeight.bold
                  ),),
                Container(
                  height:20 ,
                  width: 45,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(padding: EdgeInsets.only(left: 3,right: 2),
                    child:Row(
                      children: [
                        CustomText(
                            text: "3.5",
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.white),
                        Icon(Icons.star,size: 13,color: Colors.white,)

                      ],
                    ) ,),
                )
              ],
            ),
          ),
          
        ],
      ),

    )

      );
  }
}