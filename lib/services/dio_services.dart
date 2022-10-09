import 'package:dio/dio.dart';

import '../utils/Url.dart';

class DioService {
  static final dio = Dio(BaseOptions(baseUrl: MyApiUrl.backendUrl));
  static Future<dynamic> postMethod(
      {required String url, required value}) async {
    return await dio.post(url, data: value).then((value) => value);
  }
}
