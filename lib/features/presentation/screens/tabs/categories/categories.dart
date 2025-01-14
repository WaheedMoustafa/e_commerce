import 'package:e_commerce/features/presentation/screens/tabs/categories/categories_widgets/categories_list.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/categories_widgets/sub_categories_list.dart';
import 'package:flutter/material.dart';


class Categories extends StatelessWidget {
  const Categories({super.key});
  static const String routeName = 'categories';

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 12, vertical: 12),
      child: Row(
        children: [
          CategoriesList(),
          SizedBox(
            width: 16,
          ),
          SubCategoriesList(),        ],
      ),
    );
  }
}