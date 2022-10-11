import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sampleproject/src/utils/app_constance.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String baseUrl;
  late Map<String, String> _mainHeaders;
  ApiClient({required this.baseUrl}) {
    baseUrl = baseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstance.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response responce = await get(uri);
      return responce;
    } catch (e) {
      print('====' + e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
