import 'dart:ffi';

import 'package:get/get.dart';
import 'package:sampleproject/src/Data/repository/popular_food_repo.dart';
import 'package:sampleproject/src/Data/repository/recommended_food_repo.dart';
import 'package:sampleproject/src/Model/popular_model.dart';

class RecommendedFoodController extends GetxController {
  final RecommendedFoodRepo recommendedFoodRepo;

  RecommendedFoodController({required this.recommendedFoodRepo});
  List<dynamic> _recommendedFoodList = [];
  List<dynamic> get recommendedFoodList => _recommendedFoodList;
  bool _isloaded = false;
  bool get isloaded => _isloaded;
  Future<void> getRecommendedFoodList() async {
    Response response = await recommendedFoodRepo.getRecommendedFoodList();

    if (response.statusCode == 200) {
      print('Got Product');
      _recommendedFoodList = [];
      _recommendedFoodList.addAll(Product.fromJson(response.body).products);
      // print(_popularFoodList);
      _isloaded = true;
      update();
    } else {}
  }
}
