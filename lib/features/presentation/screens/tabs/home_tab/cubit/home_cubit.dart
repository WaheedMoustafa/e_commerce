import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:e_commerce/features/domain/mappers/product_mapper.dart';
import 'package:e_commerce/features/domain/models/category.dart';
import 'package:e_commerce/features/domain/usecase/get_categories_usecase.dart';
import 'package:e_commerce/features/domain/usecase/get_products_usecase.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/usecase/get_sub_categories_on_category_usecase.dart';
import 'home_cubit_state.dart';

@injectable
class HomeCubit extends Cubit<HomeCubitState>{
  final GetCategoriesUseCase _getCategoriesUseCase ;
  final GetProductsUseCase _getProductsUseCase ;
  final GetSubCategoriesUseCase _getSubCategoriesUseCase ;

  HomeCubit(this._getCategoriesUseCase , this._getProductsUseCase,this._getSubCategoriesUseCase) : super (HomeCubitState.initial());

  void loadCategories ()async{
    emit(state.copyWith(categoriesApiState: BaseLoadingState()));
    Either<Failure,List<Category>> either =
        await _getCategoriesUseCase.execute();
    if(either.isRight){
      emit(state.copyWith(categoriesApiState: BaseSuccessState(either.right),
          selectedCategory: either.right[0]));

    }else{
      emit(state.copyWith(categoriesApiState: BaseErrorState(either.left)));
    }
  }

  void loadProducts ()async{
    emit(state.copyWith(productsApiState: BaseLoadingState()));
    Either<Failure,List<Product>> either =
    await _getProductsUseCase.execute();
    if(either.isRight){
      emit(state.copyWith(productsApiState: BaseSuccessState(either.right)));

    }else{
      emit(state.copyWith(productsApiState: BaseErrorState(either.left)));
    }
  }

  void loadSubCategories (String categoryId)async{
    emit(state.copyWith(subCategoriesApiState: BaseLoadingState()));
    Either<Failure,List<Category>> either =
    await _getSubCategoriesUseCase.execute(categoryId);
    if(either.isRight){
      emit(state.copyWith(subCategoriesApiState: BaseSuccessState(either.right)));

    }else{
      emit(state.copyWith(subCategoriesApiState: BaseErrorState(either.left)));
    }
  }

  void onSelectedCategoryPressed(Category category){
    emit(state.copyWith(selectedCategory: category));
    loadSubCategories(category.id!);
  }

}