import 'package:get/get.dart';
import 'package:sampleproject/src/Data/repository/cart_repo.dart';
import 'package:sampleproject/src/Model/cart_model.dart';
import 'package:sampleproject/src/Model/popular_model.dart';

class CartCotroller extends GetxController {
  final CartRepo cartRepo;

  CartCotroller({required this.cartRepo});
  Map<int, CartModel> _items = {};

  void addItem(ProductModel productModel, int quantity) {
    // print('length of items ' + _items.length.toString());

    _items.putIfAbsent(productModel.id!, () {
      print('ading item to cart quantity is ' +
          productModel.id!.toString() +
          'quantity is ' +
          quantity.toString());
      _items.forEach(
        (key, value) {
          print('Quantity is ' + value.quantity.toString());
        },
      );
      return CartModel(
          id: productModel.id,
          name: productModel.name,
          img: productModel.img,
          price: productModel.price,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString());
    });
  }
}
