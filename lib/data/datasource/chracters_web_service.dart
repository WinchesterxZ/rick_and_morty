import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/util/app_strings.dart';

class ChractersWebService {
  late Dio dio;

  ChractersWebService() {
    BaseOptions options = BaseOptions(
        baseUrl: AppStrings.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10));
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllChracters() async {
    try {
      Response response = await dio.get(AppStrings.endpoint);
      log('${response.statusCode}');
      return response.data['results'];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
