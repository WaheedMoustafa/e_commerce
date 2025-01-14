import 'package:e_commerce/features/data/models/home_models/response/categories_dm.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/either.dart';
import '../../../data/models/home_models/response/product_dm.dart';
import '../../mappers/product_mapper.dart';
import '../../models/category.dart';


abstract class HomeRepo{
  Future<Either<Failure,List<Category>>> getCategories();
  Future<Either<Failure,List<Category>>> getSubCategories(String categoryId);
  Future<Either<Failure,List<Product>>> getProducts ([String? category]);

}
