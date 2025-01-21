import 'package:e_commerce/core/utils/app_const.dart';
import 'package:e_commerce/features/presentation/screens/tabs/favourites/wish_list_widgets/favourite_item.dart';
import 'package:flutter/material.dart';



class WishList extends StatelessWidget {
  const WishList({super.key});
  static const String routeName= 'wish list';

  @override
  Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 14, vertical: 10),
            child: ListView.builder(
              itemCount: AppConstants.favoriteProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child:
                  FavoriteItem(product: AppConstants.favoriteProducts[index]),
                );
              },
            ));
      }

  }
