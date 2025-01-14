import '../../data/models/home_models/response/product_dm.dart';

class ProductDM {
  final num sold;
  final List<String> images;
  final List<ProductDM> subcategory;
  final num ratingsQuantity;
  final String id;
  final String title;
  final String description;
  final num quantity;
  final num price;
  final String imageCover;
  final num ratingsAverage;

  ProductDM({
    required this.sold,
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.ratingsAverage,
  });
}
