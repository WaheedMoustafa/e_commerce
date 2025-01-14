import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../core/dio_utils.dart';

@module
abstract class NetworkModule{
  @singleton
  InternetConnectionChecker getInternetConnectionChecker () =>
      InternetConnectionChecker();
  @singleton
  Dio getDio () => DioUtils.init() ;
}