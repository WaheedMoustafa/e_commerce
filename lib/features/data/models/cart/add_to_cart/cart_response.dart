import 'cart_dm.dart';
import 'dart:convert';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "6787bc8c5197532f719e2c75"
/// data : {"_id":"6787bc8c5197532f719e2c75","cartOwner":"6787bb3c5197532f719e2a4e","products":[{"count":1,"_id":"6787bc8c5197532f719e2c76","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2025-01-15T13:47:56.732Z","updatedAt":"2025-01-15T13:47:56.904Z","__v":0,"totalCartPrice":149}

CartResponse addToCartResponseFromJson(String str) => CartResponse.fromJson(json.decode(str));
String addToCartResponseToJson(CartResponse data) => json.encode(data.toJson());
class CartResponse {
  CartResponse({
      String? status, 
      String? message, 
      num? numOfCartItems, 
      String? cartId, 
      CartDM? data,}){
    _status = status;
    _message = message;
    _numOfCartItems = numOfCartItems;
    _cartId = cartId;
    _data = data;
}

  CartResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _numOfCartItems = json['numOfCartItems'];
    _cartId = json['cartId'];
    _data = json['data'] != null ? CartDM.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  num? _numOfCartItems;
  String? _cartId;
  CartDM? _data;
CartResponse copyWith({  String? status,
  String? message,
  num? numOfCartItems,
  String? cartId,
  CartDM? data,
}) => CartResponse(  status: status ?? _status,
  message: message ?? _message,
  numOfCartItems: numOfCartItems ?? _numOfCartItems,
  cartId: cartId ?? _cartId,
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  num? get numOfCartItems => _numOfCartItems;
  String? get cartId => _cartId;
  CartDM? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['numOfCartItems'] = _numOfCartItems;
    map['cartId'] = _cartId;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}