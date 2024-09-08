import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/util/app_strings.dart';

class ChractersWebService {
  late Dio dio;

  ChractersWebService() {
    BaseOptions options = BaseOptions(
        baseUrl: AppStrings.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20));
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllChracters() async {
    try {
      Response response = await dio.get(AppStrings.endpoint);
      log(response.data);
      return response.data;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
