import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:e_commerce/features/presentation/screens/auth/sign_up/cubit/sign_up_cubit_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../domain/repositories/auth_repository.dart';

@injectable
class SignUpCubit extends Cubit<SignUpCubitState>{
  AuthRepository authRepository;

  SignUpCubit(this.authRepository) : super (SignUpCubitState.initial());

  void register(String name ,String phone , String email , String password) async{
    Either<Failure,void> either = await authRepository.register(name, phone, email, password);
    if(either.isLeft){
      emit(SignUpCubitState(registerState: BaseErrorState(either.left)));
    }else{
      emit(SignUpCubitState(registerState: BaseSuccessState(null)));
    }
  }

}