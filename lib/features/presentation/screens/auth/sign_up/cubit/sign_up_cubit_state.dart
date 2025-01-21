import 'package:e_commerce/features/base/base_api_state.dart';

class SignUpCubitState {
  late BaseApiState registerState ;
  SignUpCubitState({required this.registerState});

  SignUpCubitState.initial(){
  registerState = BaseIdleState();
  }
}