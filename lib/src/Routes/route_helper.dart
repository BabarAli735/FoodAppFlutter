import 'package:get/get.dart';
import 'package:sampleproject/src/Screens/Food/popular_food_detail.dart';
import 'package:sampleproject/src/Screens/Food/recommded_food_detail.dart';
import 'package:sampleproject/src/Screens/Home/main_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popularfood";
  static const String recommendedFood = "/recommendedFood";
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getrecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';
  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFooddetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn)
  ];
}
