import 'dart:convert';

import '../../home_models/response/product_dm.dart';


/// count : 1
/// _id : "6787bc8c5197532f719e2c76"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

CartProductDM productsFromJson(String str) => CartProductDM.fromJson(json.decode(str));
String productsToJson(CartProductDM data) => json.encode(data.toJson());
class CartProductDM {
  CartProductDM({
      num? count, 
      String? id, 
      ProductDM? product,
      num? price,}){
    _count = count;
    _id = id;
    _product = product;
    _price = price;
}

  CartProductDM.fromJson(dynamic json) {
    _count = json['count'];
    _id = json['_id'];
    _product = json['product'];
    _price = json['price'];
  }
  num? _count;
  String? _id;
  ProductDM? _product;
  num? _price;
CartProductDM copyWith({  num? count,
  String? id,
  ProductDM? product,
  num? price,
}) => CartProductDM(  count: count ?? _count,
  id: id ?? _id,
  product: product ?? _product,
  price: price ?? _price,
);
  num? get count => _count;
  String? get id => _id;
  ProductDM? get product => _product;
  num? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['_id'] = _id;
    map['product'] = _product;
    map['price'] = _price;
    return map;
  }

}