import 'cart_product_dm.dart';
import 'dart:convert';

/// _id : "6787bc8c5197532f719e2c75"
/// cartOwner : "6787bb3c5197532f719e2a4e"
/// products : [{"count":1,"_id":"6787bc8c5197532f719e2c76","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2025-01-15T13:47:56.732Z"
/// updatedAt : "2025-01-15T13:47:56.904Z"
/// __v : 0
/// totalCartPrice : 149

CartDM dataFromJson(String str) => CartDM.fromJson(json.decode(str));
String dataToJson(CartDM data) => json.encode(data.toJson());
class CartDM {
  CartDM({
      String? id, 
      String? cartOwner, 
      List<CartProductDM>? products,
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      num? totalCartPrice,}){
    _id = id;
    _cartOwner = cartOwner;
    _products = products;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _totalCartPrice = totalCartPrice;
}

  CartDM.fromJson(dynamic json) {
    _id = json['_id'];
    _cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(CartProductDM.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _totalCartPrice = json['totalCartPrice'];
  }
  String? _id;
  String? _cartOwner;
  List<CartProductDM>? _products;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  num? _totalCartPrice;
CartDM copyWith({  String? id,
  String? cartOwner,
  List<CartProductDM>? products,
  String? createdAt,
  String? updatedAt,
  num? v,
  num? totalCartPrice,
}) => CartDM(  id: id ?? _id,
  cartOwner: cartOwner ?? _cartOwner,
  products: products ?? _products,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
  totalCartPrice: totalCartPrice ?? _totalCartPrice,
);
  String? get id => _id;
  String? get cartOwner => _cartOwner;
  List<CartProductDM>? get products => _products;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;
  num? get totalCartPrice => _totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['cartOwner'] = _cartOwner;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['totalCartPrice'] = _totalCartPrice;
    return map;
  }

}