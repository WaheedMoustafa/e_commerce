import 'package:e_commerce/features/domain/models/cart.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/either.dart';

abstract class CartRepository{
  Future<Either<Failure,Cart>> getUserCart();
  Future<Either<Failure,Cart>> addToCart(String productId);
  Future<Either<Failure,Cart>> removeFromCart(String productId);
  Future<Either<Failure,Cart>> updateCart(String productId , num count);

}