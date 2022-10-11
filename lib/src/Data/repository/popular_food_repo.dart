import 'package:get/get.dart';
import 'package:sampleproject/src/Data/api/api_client.dart';
import 'package:sampleproject/src/utils/app_constance.dart';

class PopularFoodRepo extends GetxService {
  final ApiClient apiClient;

  PopularFoodRepo({required this.apiClient});
  Future<Response> getPopularFoodList() async {
    return await apiClient.getData(AppConstance.POPULAR_FOOD_URL);
  }
}
