import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_consumer.dart';

class DioHelper implements ApiConsumer {
  Dio dio;
  DioHelper({required this.dio}) {
    dio.options
      ..baseUrl = ApiConstants.baseUrl
      ..responseType = ResponseType.json
      ..contentType = ApiConstants.applicationJson
      ..receiveDataWhenStatusError = true;
  }

  @override
  Future get({required String path, Map<String, dynamic>? query}) async {
    Response response = await dio.get(path, queryParameters: query);
    return response;
  }
}
