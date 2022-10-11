import 'dart:ffi';

import 'package:get/get.dart';
import 'package:sampleproject/src/Data/repository/popular_food_repo.dart';
import 'package:sampleproject/src/Model/popular_model.dart';

class PopularFoodController extends GetxController {
  final PopularFoodRepo popularFoodRepo;

  PopularFoodController({required this.popularFoodRepo});
  List<dynamic> _popularFoodList = [];
  List<dynamic> get popularFoodList => _popularFoodList;
  bool _isloaded = false;
  bool get isloaded => _isloaded;
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
}
