import 'package:get/get.dart';
import 'package:sampleproject/src/Data/api/api_client.dart';
import 'package:sampleproject/src/utils/app_constance.dart';

class RecommendedFoodRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedFoodRepo({required this.apiClient});
  Future<Response> getRecommendedFoodList() async {
    return await apiClient.getData(AppConstance.RECOMMEDED_FOOD_URL);
  }
}
