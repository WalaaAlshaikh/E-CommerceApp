import 'package:ecommerc/model/productModel.dart';
import 'package:ecommerc/service/network/products_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController{
  // the data from api we want to put them in al list
  var productList= <ProductModel>[].obs;
  var favtList= <ProductModel>[].obs;
  var isLoading=true.obs;

  var box=GetStorage();



  @override
  void onInit() {
    getProducts();
    box.read<List>("isFav");
    
    List? storedFav= box.read<List>("isFav");
    if(storedFav !=null){
      favtList= storedFav.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    super.onInit();
  }


  void getProducts() async{

   var products= await ProductServices.getProduct();
   try{
     isLoading(true);
     if(products.isNotEmpty){
       productList.addAll(products);
     }
//finally means after it finish what should it do
   }
   finally{
     isLoading(false);
   }
  }

  void manageFav( int productId ) async {
    // navigate the index inside the list where its id equal to the id that i choose
   var indexWanted= favtList.indexWhere((element) => element.id== productId);
   print("-------------");
   print(indexWanted);
   print("-------------");
   if(indexWanted>=0){
     favtList.removeAt(indexWanted);
     await box.remove("isFav");
   }else {
     // adding items from product model (parent list) to favourite list (child) based on the id
     favtList.add( productList.firstWhere((element) => element.id == productId));

    await box.write("isFav", favtList);



  }

}
  bool isFav( int productId){
    //navigate in the parent list is the id of its item same as the id that i will give u or not
    return favtList.any((element) => element.id == productId);

  }

}