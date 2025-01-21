import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/domain/mappers/product_mapper.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_details/product_details.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/color_app.dart';
import '../../../../../../core/widgets/heart_button.dart';
import 'add_to_cart_button.dart';
import 'favourite_item_details.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.product});
  final Map<String,dynamic> product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.routeName, arguments: product);
      },
      child: Container(
        height: 135,
        padding: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.primary.withOpacity(.3))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border:
                      Border.all(color: AppColor.primary.withOpacity(.6))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  width: 120,
                  height: 135,
                  fit: BoxFit.cover,
                  imageUrl: product["imageUrl"],
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: AppColor.primary,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: FavouriteItemDetails(
                      product: product,
                    ))),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeartButton(
                    onTap: () {
                  //TODO:remove product from wish list
                }),
                const SizedBox(height: 14),
                AddToCartButton(
                  onPressed: () {
                    //TODO:add product to cart
                  },
                  text: 'Add To Cart',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
