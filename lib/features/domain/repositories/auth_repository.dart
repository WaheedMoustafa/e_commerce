import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/either.dart';

abstract class AuthRepository{
  Future<Either<Failure,void>> login(String email , String password);
  Future<Either<Failure,void>>  register(String name , String phone,String email , String password);

}