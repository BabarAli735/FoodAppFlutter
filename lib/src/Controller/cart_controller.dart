import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/src/Constance/them.dart';
import 'package:sampleproject/src/Data/repository/cart_repo.dart';
import 'package:sampleproject/src/Model/cart_model.dart';
import 'package:sampleproject/src/Model/popular_model.dart';

class CartCotroller extends GetxController {
  final CartRepo cartRepo;

  CartCotroller({required this.cartRepo});
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel productModel, int quantity) {
    var tottalQuantity = 0;
    if (_items.containsKey(productModel.id!)) {
      _items.update(productModel.id!, (value) {
        tottalQuantity = value.quantity! + quantity;
        return CartModel(
            id: value.id,
            name: value.name,
            img: value.img,
            price: value.price,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
      if (tottalQuantity <= 0) {
        _items.remove(productModel.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(productModel.id!, () {
          return CartModel(
              id: productModel.id,
              name: productModel.name,
              img: productModel.img,
              price: productModel.price,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString());
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

  bool exitInCart(ProductModel productModel) {
    if (_items.containsKey(productModel.id!)) {
      return true;
    } else
      return false;
  }

  int getQuantity(ProductModel productModel) {
    var quantity = 0;
    if (_items.containsKey(productModel.id!)) {
      _items.forEach((key, value) {
        if (key == productModel.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totlQuantity = 0;
    _items.forEach((key, value) {
      totlQuantity += value.quantity!;
    });
    return totlQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }
}
