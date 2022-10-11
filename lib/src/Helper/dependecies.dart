import 'package:get/get.dart';
import 'package:sampleproject/src/Controller/popular_food_Controller.dart';
import 'package:sampleproject/src/Controller/recommended_food_controller.dart';
import 'package:sampleproject/src/Data/api/api_client.dart';
import 'package:sampleproject/src/Data/repository/popular_food_repo.dart';
import 'package:sampleproject/src/Data/repository/recommended_food_repo.dart';
import 'package:sampleproject/src/utils/app_constance.dart';

Future<void> init() async {
  //Api client
  Get.lazyPut(() => ApiClient(baseUrl: AppConstance.BASE_URL));
  //repo
  Get.lazyPut(() => PopularFoodRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedFoodRepo(apiClient: Get.find()));

// controller
  Get.lazyPut(() => PopularFoodController(popularFoodRepo: Get.find()));
  Get.lazyPut(() => RecommendedFoodController(recommendedFoodRepo: Get.find()));
}
