import 'package:dio/dio.dart';

import '../core/constants/constants.dart';
import '../core/utils/app_helper.dart';

class ApiClient {
  static const String _baseUrl = "https://jsonplaceholder.org/";

  Dio? dio;

  ApiClient() {
    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  Future<Response?> getAPI(
    String url, {
    Map<String, dynamic>? mQueryParameters,
    bool needLoader = false,
  }) async {
    logger.w('URL:  $url\nQueryParameters: $mQueryParameters');

    showLoader(needToShow: needLoader);
    hideKeyboard();
    try {
      Response? response = await dio?.get(
        url,
        queryParameters: mQueryParameters,
      );
      logger.w(
          'URL:  $url\nHeader: ${dio?.options.headers}\nQueryParameters: $mQueryParameters\nResponse: $response');
      if (needLoader) {
        hideLoader();
      }
      return response;
    } on DioException catch (e) {
      logger.i("Exception $e");
      return null;
    }
  }
}
