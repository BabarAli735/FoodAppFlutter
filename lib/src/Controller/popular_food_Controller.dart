import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/src/Constance/them.dart';
import 'package:sampleproject/src/Controller/cart_controller.dart';
import 'package:sampleproject/src/Data/repository/popular_food_repo.dart';
import 'package:sampleproject/src/Model/popular_model.dart';

class PopularFoodController extends GetxController {
  final PopularFoodRepo popularFoodRepo;

  PopularFoodController({required this.popularFoodRepo});
  List<dynamic> _popularFoodList = [];
  List<dynamic> get popularFoodList => _popularFoodList;
  bool _isloaded = false;
  bool get isloaded => _isloaded;
  int _quantity = 0;
  int _inCartiems = 0;
  int get inCartItems => _inCartiems + _quantity;
  int get quantity => _quantity;
  late CartCotroller _cart;
  Future<void> getPopulaFoodList() async {
    Response response = await popularFoodRepo.getPopularFoodList();

    if (response.statusCode == 200) {
      print('Got Product');
      _popularFoodList = [];
      _popularFoodList.addAll(Product.fromJson(response.body).products);
      // print(_popularFoodList);
      _isloaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncreament) {
    if (isIncreament) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        "Item Count",
        "You Can't reduce More Item",
        backgroundColor: AppColor.primary,
        colorText: Colors.white,
      );
      return 0;
    }
    if (quantity > 20) {
      Get.snackbar(
        "Item Count",
        "You Can't increase More Item",
        backgroundColor: AppColor.primary,
        colorText: Colors.white,
      );
      return 20;
    } else
      return quantity;
  }

  void initProduct(ProductModel productModel, CartCotroller cart) {
    _quantity = 0;
    _inCartiems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.exitInCart(productModel);

    if (exist) {
      _inCartiems = _cart.getQuantity(productModel);
    }
    print("The Quantity inCartItems=" + _inCartiems.toString());
  }

  void addCartItem(ProductModel productModel) {
    if (_quantity > 0) {
      _cart.addItem(productModel, _quantity);
      _quantity = 0;
      _cart.items.forEach((key, value) {
        print("The is id is " +
            value.id.toString() +
            "The Quantity is " +
            value.quantity.toString());
      });
    } else {
      Get.snackbar(
        "Item Count",
        "You should ad least add an Item in the cart",
        backgroundColor: AppColor.primary,
        colorText: Colors.white,
      );
    }
  }
}
