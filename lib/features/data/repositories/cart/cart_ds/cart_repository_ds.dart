import 'package:e_commerce/features/domain/models/cart.dart';
import 'package:either_dart/either.dart';
import '../../../../failure/failure.dart';
import '../../../models/cart/add_to_cart/cart_dm.dart';

abstract class CartRepositoryDs {
  Future<Either<Failure,CartDM>> getUserCart();
  Future<Either<Failure,CartDM>> addToCart(String productId);
  Future<Either<Failure,CartDM>> removeFromCart(String productId);
  Future<Either<Failure,CartDM>> updateCart(String productId , num count);

  }