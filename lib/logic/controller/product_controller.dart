import 'package:ecommerc/model/productModel.dart';
import 'package:ecommerc/service/network/products_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  // the data from api we want to put them in al list
  var productList= <ProductModel>[].obs;
  var isLoading=true.obs;

  @override
  void onInit() {
    getProducts();
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
   } finally{
     isLoading(false);

   }

  }

}