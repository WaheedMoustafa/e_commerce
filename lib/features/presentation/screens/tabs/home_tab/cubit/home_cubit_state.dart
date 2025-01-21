import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/models/category.dart';


@injectable
class HomeCubitState{
  late BaseApiState categoriesApiState;
  late BaseApiState productsApiState;
  late BaseApiState subCategoriesApiState;
  Category? selectedCategory ;

  HomeCubitState({this.selectedCategory,required this.categoriesApiState , required this.productsApiState,required this.subCategoriesApiState });

  HomeCubitState.initial(){
    categoriesApiState = BaseLoadingState() ;
    productsApiState = BaseLoadingState();
    subCategoriesApiState = BaseIdleState();
  }

  HomeCubitState copyWith({
    BaseApiState? categoriesApiState,
    BaseApiState? productsApiState,
    BaseApiState? subCategoriesApiState,
    Category? selectedCategory ,
  }) {
    return HomeCubitState(
      categoriesApiState: categoriesApiState ?? this.categoriesApiState,
      productsApiState: productsApiState ?? this.productsApiState,
      subCategoriesApiState:subCategoriesApiState ?? this.subCategoriesApiState ,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }



}