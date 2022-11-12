import 'package:get/get.dart';


import '../../model/productModel.dart';
import '../../service/network/category_service.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModel>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategory = false.obs;

  List<String> imageCategory = [
    "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  void getCategory() async {
    var categoryName = await CategoryServices.getCategory();

    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategory(String nameCategory) async {
    isAllCategory(true);
    categoryList.value =
    await AllCategoryServices.getAllCategory(nameCategory);

    isAllCategory(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategory(categoryNameList[index]);

    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }
}