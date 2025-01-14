import 'package:e_commerce/features/domain/mappers/category_mapper.dart';
import 'package:e_commerce/features/domain/models/category.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/home_models/response/product_dm.dart';

class Product {
  final num sold;
  final List<String> images;
  final List<Category> subcategory;
  final num ratingsQuantity;
  final String id;
  final String title;
  final String description;
  final num quantity;
  final num price;
  final String imageCover;
  final num ratingsAverage;

  Product({
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

// Extend ProductDM to add a mapper function
@injectable
class ProductMapper  {
  CategoryMapper categoryMapper ;
  ProductMapper(this.categoryMapper);

  Product toProduct(ProductDM productDm) {
    return Product(
      sold: productDm.sold ?? 0,
      images: productDm.images ?? [],
      subcategory: categoryMapper.toCategories(productDm.subcategory?? []),
      ratingsQuantity: productDm.ratingsQuantity ?? 0,
      id: productDm.id ?? '',
      title: productDm.title ?? '',
      description: productDm.description ?? '',
      quantity: productDm.quantity?? 0,
      price: productDm.price ?? 0,
      imageCover: productDm.imageCover ?? '',
      ratingsAverage: productDm.ratingsAverage ??0,
    );
  }

  List<Product> toProducts (List<ProductDM> proDm)=>
      proDm.map((productDm)=> toProduct(productDm)).toList();
}
