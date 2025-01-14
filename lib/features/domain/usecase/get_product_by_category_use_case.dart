import 'package:e_commerce/features/domain/mappers/product_mapper.dart';
import 'package:e_commerce/features/domain/repositories/home_repo/home_repo.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductByCategoryUseCase {
  HomeRepo homeRepo ;
  GetProductByCategoryUseCase(this.homeRepo);

  Future<Either<Failure,List<Product>>> execute(String categoryId){
    return homeRepo.getProducts(categoryId);

  }
}