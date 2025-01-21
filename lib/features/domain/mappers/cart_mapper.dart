import 'package:e_commerce/features/data/models/cart/add_to_cart/cart_dm.dart';
import 'package:e_commerce/features/data/models/cart/add_to_cart/cart_product_dm.dart';
import 'package:e_commerce/features/domain/mappers/category_mapper.dart';
import 'package:e_commerce/features/domain/mappers/product_mapper.dart';
import 'package:e_commerce/features/domain/models/cart.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartMapper{
  CategoryMapper categoryMapper ;
  CartMapper(this.categoryMapper);

  Cart mapToCart (CartDM cartDm){
    return Cart(products: cartDm.products?.map((cartProductDM)=>mapCartProductToProduct(cartProductDM)).toList() ??[],
        totalPrice: cartDm.totalCartPrice ?? 0);
  }

  Product mapCartProductToProduct (CartProductDM cartProductDm){
    return Product(
        sold: cartProductDm.product?.sold ?? 0,
        images: cartProductDm.product?.images ?? [],
        subcategory: categoryMapper.toCategories(cartProductDm.product?.subcategory ?? []),
        ratingsQuantity: cartProductDm.product?.ratingsQuantity ?? 0,
        id: cartProductDm.product?.id ??'',
        title: cartProductDm.product?.title ?? '',
        description: cartProductDm.product?.description ?? '',
        quantity: cartProductDm.product?.quantity ?? 0,
        price: cartProductDm.product?.price ?? 0 ,
        imageCover: cartProductDm.product?.imageCover ?? '',
        ratingsAverage: cartProductDm.product?.ratingsAverage ?? 0,
    );
  }

}