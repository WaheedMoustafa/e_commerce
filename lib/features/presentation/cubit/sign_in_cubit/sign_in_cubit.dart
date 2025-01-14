import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:e_commerce/features/presentation/cubit/sign_in_cubit/sign_in_cubit_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repositories/auth_repository.dart';


@injectable
class SignInCubit extends Cubit<SignInCubitState> {
  AuthRepository authRepository;

  SignInCubit(this.authRepository): super(SignInCubitState.initial());
  void login (String email , String password) async{
    Either<Failure,void>  response = await authRepository.login(email, password);
    if(response.isLeft){
      emit(SignInCubitState(loginState: BaseErrorState(response.left)));
    }
    else{
      emit(SignInCubitState(loginState: BaseSuccessState(null)));
    }
  }
}