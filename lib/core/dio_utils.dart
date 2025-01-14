import 'package:dio/dio.dart';

//https://ecommerce.routemisr.com

class DioUtils{
  static Dio init(){
    Dio dio = Dio() ;
    dio.options.baseUrl = 'https://ecommerce.routemisr.com';
    dio.interceptors.add(LoggingInterceptors());

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