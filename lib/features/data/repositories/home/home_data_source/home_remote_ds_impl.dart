import 'package:dio/dio.dart';
import 'package:e_commerce/features/data/models/home_models/response/categories_dm.dart';
import 'package:e_commerce/features/data/models/home_models/response/category_response.dart';
import 'package:e_commerce/features/data/models/home_models/response/product_dm.dart';
import 'package:e_commerce/features/data/models/home_models/response/product_respone.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'home_remote_ds.dart';

//https://ecommerce.routemisr.com
@Injectable(as: HomeRemoteDs)
class HomeRemoteDsImpl extends HomeRemoteDs{
  String categoriesEndPoint = 'https://ecommerce.routemisr.com/api/v1/categories';
  String productEndPoint = 'https://ecommerce.routemisr.com/api/v1/products';

  Dio dio;
  HomeRemoteDsImpl(this.dio);

  @override
  Future<Either<Failure, List<CategoryDM>>> getCategories() async{
    Response serverResponse = await dio.get(categoriesEndPoint);
    if(serverResponse.statusCode! >= 200 && serverResponse.statusCode! <= 300 ){
      CategoryResponse categoryResponse = CategoryResponse.fromJson(serverResponse.data!);
      return Right(categoryResponse.data!);
    }else{
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getProducts([String? category]) async {
    Map<String, String>? query = category!= null ? {
      'category[in]': category
    }: null;
    Response serverResponse = await dio.get(productEndPoint , queryParameters: query);
    if(serverResponse.statusCode! >= 200 && serverResponse.statusCode! <= 300 ){
      ProductResponse productResponse = ProductResponse.fromJson(serverResponse.data!);
      return Right(productResponse.data!);
    }else{
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategoryDM>>> getSubCategories(String categoryId) async{
    Response serverResponse = await dio.get('https://ecommerce.routemisr.com/api/v1/categories/$categoryId/subcategories');
    if(serverResponse.statusCode! >= 200 && serverResponse.statusCode! <= 300 ){
      CategoryResponse categoryResponse = CategoryResponse.fromJson(serverResponse.data!);
      return Right(categoryResponse.data!);
    }else{
      return Left(ApiFailure());
    }
  }

}