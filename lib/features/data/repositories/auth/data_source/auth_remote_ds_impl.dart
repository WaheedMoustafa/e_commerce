import 'package:dio/dio.dart';
import 'package:e_commerce/core/shared_pref_utils.dart';
import 'package:e_commerce/features/data/models/response/auth_response.dart';
import 'package:e_commerce/features/data/models/sign_up/request/sign_up_request.dart';
import 'package:e_commerce/features/data/repositories/auth/data_source/auth_remote_ds.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/request/login_request.dart';

@Injectable(as: AuthRemoteDs)
class AuthRemoteDsImpl extends AuthRemoteDs {
  Dio dio;

  SharedPrefUtils sharedPrefUtils;
  static const loginUrl = 'https://ecommerce.routemisr.com/api/v1/auth/signin';
  static const regUrl = 'https://ecommerce.routemisr.com/api/v1/auth/signup';

  AuthRemoteDsImpl(this.dio, this.sharedPrefUtils);

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      Response serverResponse = await dio.post(loginUrl,
          data: LoginRequest(email: email, password: password).toJson());
      AuthResponse myResponse = AuthResponse.fromJson(serverResponse.data);
      if (serverResponse.statusCode! >= 200 &&
          serverResponse.statusCode! <= 300) {
        sharedPrefUtils.saveToken(myResponse.token!);
        sharedPrefUtils.saveUser(myResponse.user!);
        return const Right(null);
      } else {
        return Left(ApiFailure());
      }
    } catch (e) {
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, void>> register(String name, String phone,
      String email, String password) async {
  try{
  Response serverResponse = await dio.post(regUrl, data: SignUpRequest(name: name,phone: phone,email: email, password:password ).toJson());
  AuthResponse myResponse = AuthResponse.fromJson(serverResponse.data);
  if(serverResponse.statusCode! >= 200 && serverResponse.statusCode! <=300){
  sharedPrefUtils.saveToken(myResponse.token!);
  sharedPrefUtils.saveUser(myResponse.user!);
  return const Right(null);
  }else{
  return Left(ApiFailure());
  }
  }catch

  (

  e){
  return Left(ApiFailure());
  }
}


}