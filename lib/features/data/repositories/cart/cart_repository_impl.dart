import 'package:e_commerce/features/data/models/cart/add_to_cart/cart_dm.dart';
import 'package:e_commerce/features/data/repositories/cart/cart_ds/cart_repository_ds.dart';
import 'package:e_commerce/features/domain/models/cart.dart';
import 'package:e_commerce/features/domain/repositories/cart_repository.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../domain/mappers/cart_mapper.dart';


@Injectable(as: CartRepository)
class CartRepositoryImpl extends CartRepository{
  final InternetConnectionChecker internetConnectionChecker ;
  final CartRepositoryDs cartRepositoryDs ;
  final CartMapper cartMapper;

  CartRepositoryImpl( this.cartMapper, this.cartRepositoryDs ,  this.internetConnectionChecker);


  @override
  Future<Either<Failure, Cart>> addToCart(String productId) async {
    if(await internetConnectionChecker.hasConnection){
      Either<Failure,CartDM> either = await cartRepositoryDs.addToCart(productId);
      if(either.isRight){
      return Right(cartMapper.mapToCart(either.right));}
      else{
        return Left(either.left);
      }
    }else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Cart>> getUserCart() async {
    if(await internetConnectionChecker.hasConnection){
      Either<Failure,CartDM> either = await cartRepositoryDs.getUserCart();
      if(either.isRight){
        return Right(cartMapper.mapToCart(either.right));}
      else{
        return Left(either.left);
      }
    }else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Cart>> removeFromCart(String productId) async {
    if(await internetConnectionChecker.hasConnection){
      Either<Failure,CartDM> either = await cartRepositoryDs.removeFromCart(productId);
      if(either.isRight){
        return Right(cartMapper.mapToCart(either.right));}
      else{
        return Left(either.left);
      }
    }else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Cart>> updateCart(String productId, num count) async {
    if(await internetConnectionChecker.hasConnection){
      Either<Failure,CartDM> either = await cartRepositoryDs.updateCart(productId,count);
      if(either.isRight){
        return Right(cartMapper.mapToCart(either.right));}
      else{
        return Left(either.left);
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}