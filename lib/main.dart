import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sampleproject/src/Controller/popular_food_Controller.dart';
import 'package:sampleproject/src/Controller/recommended_food_controller.dart';
import 'package:sampleproject/src/Routes/route_helper.dart';
import 'package:sampleproject/src/Screens/Food/popular_food_detail.dart';
import 'package:sampleproject/src/Screens/Food/recommded_food_detail.dart';
import 'package:sampleproject/src/Screens/Home/main_page.dart';
import './src//Helper/dependecies.dart' as dev;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dev.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularFoodController>().getPopulaFoodList();
    Get.find<RecommendedFoodController>().getRecommendedFoodList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
    );
  }
}
