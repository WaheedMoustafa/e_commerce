import 'dart:convert';

/// currentPage : 1
/// numberOfPages : 2
/// limit : 40
/// nextPage : 2

Metadata metadataFromJson(String str) => Metadata.fromJson(json.decode(str));
String metadataToJson(Metadata data) => json.encode(data.toJson());
class Metadata {
  Metadata({
      num? currentPage, 
      num? numberOfPages, 
      num? limit, 
      num? nextPage,}){
    _currentPage = currentPage;
    _numberOfPages = numberOfPages;
    _limit = limit;
    _nextPage = nextPage;
}

  Metadata.fromJson(dynamic json) {
    _currentPage = json['currentPage'];
    _numberOfPages = json['numberOfPages'];
    _limit = json['limit'];
    _nextPage = json['nextPage'];
  }
  num? _currentPage;
  num? _numberOfPages;
  num? _limit;
  num? _nextPage;
Metadata copyWith({  num? currentPage,
  num? numberOfPages,
  num? limit,
  num? nextPage,
}) => Metadata(  currentPage: currentPage ?? _currentPage,
  numberOfPages: numberOfPages ?? _numberOfPages,
  limit: limit ?? _limit,
  nextPage: nextPage ?? _nextPage,
);
  num? get currentPage => _currentPage;
  num? get numberOfPages => _numberOfPages;
  num? get limit => _limit;
  num? get nextPage => _nextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = _currentPage;
    map['numberOfPages'] = _numberOfPages;
    map['limit'] = _limit;
    map['nextPage'] = _nextPage;
    return map;
  }

}