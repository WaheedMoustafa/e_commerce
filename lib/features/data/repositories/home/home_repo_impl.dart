import 'package:e_commerce/features/data/models/home_models/response/categories_dm.dart';
import 'package:e_commerce/features/data/models/home_models/response/product_dm.dart';
import 'package:e_commerce/features/data/repositories/home/home_data_source/home_remote_ds.dart';
import 'package:e_commerce/features/domain/repositories/home_repo/home_repo.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../domain/mappers/category_mapper.dart';
import '../../../domain/mappers/product_mapper.dart';
import '../../../domain/models/category.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  InternetConnectionChecker internetConnectionChecker ;
  HomeRemoteDs homeRemoteDs ;
  CategoryMapper categoryMapper ;
  ProductMapper productMapper ;
  HomeRepoImpl(this.homeRemoteDs,this.internetConnectionChecker,this.categoryMapper,this.productMapper);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    if(await internetConnectionChecker.hasConnection){
      Either<Failure,List<CategoryDM>> either = await homeRemoteDs.getCategories();
      if(either.isRight){
        return Right(categoryMapper.toCategories(either.right));
      } else {
        return Left(either.left);
      }
    }else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts([String? category]) async{
   if(await internetConnectionChecker.hasConnection){
     Either<Failure,List<ProductDM>> either = await  homeRemoteDs.getProducts(category);
     if(either.isRight){
       return Right(productMapper.toProducts(either.right));
     } else {
       return Left(either.left);
     }
  }else{
     return Left(ConnectionFailure());
  }
  }

  @override
  Future<Either<Failure, List<Category>>> getSubCategories(String categoryId) async {
    if(await internetConnectionChecker.hasConnection){
      Either<Failure,List<CategoryDM>> either = await homeRemoteDs.getSubCategories(categoryId);
      if(either.isRight){
        return Right(categoryMapper.toCategories(either.right));
      } else {
        return Left(either.left);
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}