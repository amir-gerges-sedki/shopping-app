import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopping_app/model/poducts_model.dart';
import 'package:shopping_app/services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var favoriteList = <ProductModel>[].obs;
  var searchList = <ProductModel>[].obs;
  TextEditingController searchText = TextEditingController();
  RxBool isLoading = true.obs;
  GetStorage getStorage = GetStorage();

  @override
  void onInit() {
    List? listFavourite = getStorage.read<List>('key');
    if (listFavourite != null) {
      favoriteList =
          listFavourite.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading.value = true;
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading.value = false;
    }
  }

  void addToFavorite(int productId) async {
    favoriteList
        .add(productList.firstWhere((element) => element.id == productId));

    await getStorage.write('key', favoriteList);
  }

  void removeFromFavorite(int productId) async {
    var addingindex =
        favoriteList.indexWhere((element) => element.id == productId);

    if (addingindex >= 0) {
      favoriteList.removeAt(addingindex);
      await getStorage.remove('key');
    }
  }

  bool isFavorite(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }

  void addToCart(int productId) async {
    favoriteList
        .add(productList.firstWhere((element) => element.id == productId));

    await getStorage.write('key', favoriteList);
  }

  void search(String productName) {
    productName = productName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      return searchTitle.contains(productName);
    }).toList();
  }

  void clearSearchText() {
    searchText.clear();
    search('');
  }
}
