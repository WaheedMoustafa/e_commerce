import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:e_commerce/features/domain/mappers/product_mapper.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/cubit/product_list_cubit_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/usecase/get_product_by_category_use_case.dart';

@injectable
 class ProductListCubit extends Cubit<ProductListCubitState>{
  final GetProductByCategoryUseCase _getProductByCategoryUseCase  ;
  ProductListCubit(this._getProductByCategoryUseCase): super(ProductListCubitState.initial()) ;

  void loadProducts (String categoryId) async {
   emit(state.copyWith(productApiState: BaseLoadingState()));
   Either<Failure , List<Product>> either =
       await _getProductByCategoryUseCase.execute(categoryId);
   if(either.isRight){
    emit(state.copyWith(productApiState: BaseSuccessState(either.right)));
   }else{
    emit(state.copyWith(productApiState: BaseErrorState(either.left)));

   }
  }



}