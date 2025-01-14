import 'package:e_commerce/features/data/models/home_models/response/categories_dm.dart';
import 'dart:convert';

/// sold : 8630
/// images : ["https://ecommerce.routemisr.com/Route-Academy-products/1680403397482-1.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403397482-2.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403397483-3.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403397485-4.jpeg"]
/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// ratingsQuantity : 18
/// _id : "6428ebc6dc1175abc65ca0b9"
/// title : "Woman Shawl"
/// slug : "woman-shawl"
/// description : "Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen"
/// quantity : 225
/// price : 170
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// createdAt : "2023-04-02T02:43:18.400Z"
/// updatedAt : "2024-11-30T13:39:38.658Z"
/// id : "6428ebc6dc1175abc65ca0b9"

ProductDM dataFromJson(String str) => ProductDM.fromJson(json.decode(str));
String dataToJson(ProductDM data) => json.encode(data.toJson());
class ProductDM {
  ProductDM({
      num? sold, 
      List<String>? images, 
      List<CategoryDM>? subcategory,
      num? ratingsQuantity, 
      String? id, 
      String? title, 
      String? slug, 
      String? description, 
      num? quantity, 
      num? price, 
      String? imageCover,
      num? ratingsAverage, 
      String? createdAt, 
      String? updatedAt, 
     }){
    _sold = sold;
    _images = images;
    _subcategory = subcategory;
    _ratingsQuantity = ratingsQuantity;
    _id = id;
    _title = title;
    _slug = slug;
    _description = description;
    _quantity = quantity;
    _price = price;
    _imageCover = imageCover;

    _ratingsAverage = ratingsAverage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _id = id;
}

  ProductDM.fromJson(dynamic json) {
    _sold = json['sold'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      _subcategory = [];
      json['subcategory'].forEach((v) {
        _subcategory?.add(CategoryDM.fromJson(v));
      });
    }
    _ratingsQuantity = json['ratingsQuantity'];
    _id = json['_id'];
    _title = json['title'];
    _slug = json['slug'];
    _description = json['description'];
    _quantity = json['quantity'];
    _price = json['price'];
    _imageCover = json['imageCover'];

    _ratingsAverage = json['ratingsAverage'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  num? _sold;
  List<String>? _images;
  List<CategoryDM>? _subcategory;
  num? _ratingsQuantity;
  String? _id;
  String? _title;
  String? _slug;
  String? _description;
  num? _quantity;
  num? _price;
  String? _imageCover;

  num? _ratingsAverage;
  String? _createdAt;
  String? _updatedAt;
ProductDM copyWith({  num? sold,
  List<String>? images,
  List<CategoryDM>? subcategory,
  num? ratingsQuantity,
  String? id,
  String? title,
  String? slug,
  String? description,
  num? quantity,
  num? price,
  String? imageCover,
  num? ratingsAverage,
  String? createdAt,
  String? updatedAt,
}) => ProductDM(  sold: sold ?? _sold,
  images: images ?? _images,
  subcategory: subcategory ?? _subcategory,
  ratingsQuantity: ratingsQuantity ?? _ratingsQuantity,
  id: id ?? _id,
  title: title ?? _title,
  slug: slug ?? _slug,
  description: description ?? _description,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  imageCover: imageCover ?? _imageCover,
  ratingsAverage: ratingsAverage ?? _ratingsAverage,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get sold => _sold;
  List<String>? get images => _images;
  List<CategoryDM>? get subcategory => _subcategory;
  num? get ratingsQuantity => _ratingsQuantity;
  String? get id => _id;
  String? get title => _title;
  String? get slug => _slug;
  String? get description => _description;
  num? get quantity => _quantity;
  num? get price => _price;
  String? get imageCover => _imageCover;
  num? get ratingsAverage => _ratingsAverage;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = _sold;
    map['images'] = _images;
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.map((v) => v.toJson()).toList();
    }
    map['ratingsQuantity'] = _ratingsQuantity;
    map['_id'] = _id;
    map['title'] = _title;
    map['slug'] = _slug;
    map['description'] = _description;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['imageCover'] = _imageCover;

    map['ratingsAverage'] = _ratingsAverage;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}