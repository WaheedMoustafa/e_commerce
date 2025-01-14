import 'package:e_commerce/features/failure/failure.dart';

abstract class BaseApiState{}

class BaseLoadingState extends BaseApiState{}

class BaseIdleState extends BaseApiState{}

class BaseSuccessState<T> extends BaseApiState{
   T data ;
   BaseSuccessState(this.data);
}

class BaseErrorState extends BaseApiState{
  Failure failure ;

BaseErrorState(this.failure);

}