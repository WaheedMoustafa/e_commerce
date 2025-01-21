import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:e_commerce/features/domain/models/cart.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../domain/repositories/cart_repository.dart';


@injectable
class CartCubit extends Cubit<BaseApiState>{
  final CartRepository cartRepository ;
  Cart? latestCart ;
  CartCubit(this.cartRepository):super(BaseIdleState());

  void loadCart () async{
    emit(BaseLoadingState());
    Either<Failure,Cart> either = await cartRepository.getUserCart();
    if(either.isLeft){
      emit(BaseErrorState(either.left));
    }else{
      latestCart = either.right;
      emit(BaseSuccessState(either.right));
    }
  }

  void addToCart (String productId) async{
    emit(BaseLoadingState());
    Either<Failure,Cart> either = await cartRepository.addToCart(productId);
    if(either.isLeft){
      emit(BaseErrorState(either.left));
    }else{
      latestCart = either.right;

      emit(BaseSuccessState(either.right));
    }
  }

  void removeFromCart (String productId) async{
    emit(BaseLoadingState());
    Either<Failure,Cart> either = await cartRepository.removeFromCart(productId);
    if(either.isLeft){
      emit(BaseErrorState(either.left));
    }else{
      latestCart = either.right;

      emit(BaseSuccessState(either.right));
    }
  }

  void updateCart (String productId , num count) async{
    emit(BaseLoadingState());
    Either<Failure,Cart> either = await cartRepository.updateCart(productId, count);
    if(either.isLeft){
      emit(BaseErrorState(either.left));
    }else{
      latestCart = either.right;
      emit(BaseSuccessState(either.right));
    }
  }

  bool isInCart(String proId){
    for(var product in latestCart?.products ?? []){
      if(proId == product.id){
        return true ;
      }
    }
      return false ;
    }
}