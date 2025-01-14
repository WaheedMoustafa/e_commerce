import 'package:e_commerce/features/data/repositories/auth/data_source/auth_remote_ds.dart';
import 'package:e_commerce/features/domain/repositories/auth_repository.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  InternetConnectionChecker internetConnectionChecker ;
  AuthRemoteDs authRemoteDs ;

  AuthRepositoryImpl(this.authRemoteDs,this.internetConnectionChecker);

  @override
  Future<Either<Failure,void>> login(String email, String password) async {
    if(await internetConnectionChecker.hasConnection){
      return authRemoteDs.login(email, password);
    }else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure,void>> register(String name , String phone,String email , String password) async{
    if(await internetConnectionChecker.hasConnection){
      return authRemoteDs.register(name ,phone,email, password);
    }else{
      return Left(ConnectionFailure());
    }  }
}