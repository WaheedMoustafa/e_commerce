import 'package:e_commerce/features/data/models/home_models/response/categories_dm.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/either.dart';
import '../../../models/home_models/response/product_dm.dart';


abstract class HomeRemoteDs{
  Future<Either<Failure,List<CategoryDM>>> getCategories ();
  Future<Either<Failure,List<ProductDM>>> getProducts ([String? category]);
  Future<Either<Failure,List<CategoryDM>>> getSubCategories (String categoryId);

}