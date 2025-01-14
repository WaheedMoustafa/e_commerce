import 'dart:convert';

/// _id : "6439d61c0049ad0b52b90051"
/// name : "Music"
/// slug : "music"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511964020.jpeg"
/// createdAt : "2023-04-14T22:39:24.365Z"
/// updatedAt : "2023-04-14T22:39:24.365Z"

CategoryDM dataFromJson(String str) => CategoryDM.fromJson(json.decode(str));
String dataToJson(CategoryDM data) => json.encode(data.toJson());
class CategoryDM {
  CategoryDM({
      String? id, 
      String? name, 
      String? slug,
      String? category,
      String? image, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _slug = slug;
    _image = image;
    _category = category;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CategoryDM.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
    _image = json['image'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _category = json['category'];

  }
  String? _id;
  String? _name;
  String? _slug;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  String? _category;
CategoryDM copyWith({  String? id,
  String? name,
  String? slug,
  String? image,
  String? createdAt,
  String? updatedAt,
  String? category ,
}) => CategoryDM(  id: id ?? _id,
  name: name ?? _name,
  slug: slug ?? _slug,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  category: category ?? _category ,
);
  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get category => _category ;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['category'] = _category ;
    map['image'] = _image;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}