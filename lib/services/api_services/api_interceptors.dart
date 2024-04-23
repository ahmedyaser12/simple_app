import 'package:dio/dio.dart';

import '../../core/helper/cache_helper.dart';
import 'end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        CacheHelper().getData(key: ApiKey.token) != null
            ? 'Bearer ${CacheHelper().getData(key: ApiKey.token)}'
            : null;

    super.onRequest(options, handler);
  }
}
