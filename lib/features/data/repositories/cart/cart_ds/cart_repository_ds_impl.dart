import 'package:dio/dio.dart';
import 'package:e_commerce/features/data/models/cart/add_to_cart/cart_response.dart';
import 'package:e_commerce/features/data/repositories/cart/cart_ds/cart_repository_ds.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import '../../../models/cart/add_to_cart/cart_dm.dart';

@Injectable(as: CartRepositoryDs)
class CartRepositoryDsImpl extends CartRepositoryDs {
  Dio dio;
  CartRepositoryDsImpl(this.dio);
  String getCartUrl = 'https://ecommerce.routemisr.com/api/v1/cart';

  @override
  Future<Either<Failure, CartDM>> addToCart(String productId) async {
    try {
      Response response = await dio.post(getCartUrl, data: {
        "productId": productId,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return getUserCart();
      } else {
        return Left(ApiFailure());
      }
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartDM>> getUserCart() async {
    try {
      Response response = await dio.get(getCartUrl);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        CartResponse cartResponse = CartResponse.fromJson(response.data);
        return Right(cartResponse.data!);
      } else {
        return Left(ApiFailure());
      }
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartDM>> removeFromCart(String productId) async {
    try {
      Response response = await dio.delete("$getCartUrl/$productId");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        CartResponse cartResponse = CartResponse.fromJson(response.data);
        return Right(cartResponse.data!);
      } else {
        return Left(ApiFailure());
      }
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartDM>> updateCart(
      String productId, num count) async {
    try {
      Response response = await dio.put("$getCartUrl/$productId", data: {
        "count": count,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        CartResponse cartResponse = CartResponse.fromJson(response.data);
        return Right(cartResponse.data!);
      } else {
        return Left(ApiFailure());
      }
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
