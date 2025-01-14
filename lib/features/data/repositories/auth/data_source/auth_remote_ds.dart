import 'package:either_dart/either.dart';

import '../../../../failure/failure.dart';

abstract class AuthRemoteDs{
  Future<Either<Failure,void>>  login(String email , String password);
  Future<Either<Failure,void>>  register(String name , String phone,String email,String password);

}