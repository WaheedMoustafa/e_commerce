import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductListCubitState {
  late BaseApiState productListApiState;

  ProductListCubitState({required this.productListApiState});
  ProductListCubitState.initial (){
    productListApiState = BaseLoadingState();
  }

  ProductListCubitState copyWith({BaseApiState? productApiState })=>
      ProductListCubitState(productListApiState: productApiState ?? this.productListApiState );

}