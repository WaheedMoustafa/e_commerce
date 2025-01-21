import 'package:dio/dio.dart';
import 'package:e_commerce/core/shared_pref_utils.dart';

//https://ecommerce.routemisr.com

class DioUtils {
  static Dio init() {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://ecommerce.routemisr.com';
    dio.interceptors.add(LoggingInterceptors());
    dio.interceptors.add(AuthInterceptors(SharedPrefUtils()));

    return Dio();
  }
}

class LoggingInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    handler.next(err);
  }
}

class AuthInterceptors extends Interceptor {
  SharedPrefUtils sharedPrefUtils;
  AuthInterceptors(this.sharedPrefUtils);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers ={ "token": await sharedPrefUtils.getToken()};
    handler.next(options);
  }
}
