import 'package:e_commerce/features/domain/models/category.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../failure/failure.dart';
import '../repositories/home_repo/home_repo.dart';

@injectable
class GetSubCategoriesUseCase{
  HomeRepo homeRepo ;
  GetSubCategoriesUseCase(this.homeRepo);

  Future<Either<Failure,List<Category>>> execute (String categoryId){
    return homeRepo.getSubCategories(categoryId);
  }

}