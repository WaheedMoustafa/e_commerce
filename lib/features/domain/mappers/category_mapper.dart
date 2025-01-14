import 'package:e_commerce/features/data/models/home_models/response/categories_dm.dart';
import 'package:e_commerce/features/domain/models/category.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryMapper {

  Category toCategory(CategoryDM categoryDm)=>
      Category(id: categoryDm.id! ,image:categoryDm.image ??'' ,name:categoryDm.name ??'');

  List<Category> toCategories (List<CategoryDM> categoriesDm) {
    return categoriesDm.map((categoryDm)=> toCategory(categoryDm)).toList();

  }
}