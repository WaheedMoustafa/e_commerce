import 'package:e_commerce/features/domain/mappers/product_mapper.dart';

class Cart{
  num totalPrice ;
  List<Product> products;

  Cart({required this.products , required this.totalPrice});
}