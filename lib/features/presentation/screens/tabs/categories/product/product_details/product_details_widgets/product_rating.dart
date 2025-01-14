import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/core/utils/images_app.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/widgets/product_counter.dart';

class ProductRating extends StatelessWidget {
  final String productBuyers;
  final String productRating;
  const ProductRating({super.key , required this.productBuyers , required this.productRating});
  final TextStyle getMediumStyle = const TextStyle(fontSize: 14 , color: AppColor.primary);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColor.primary.withOpacity(.3),
                width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            '$productBuyers Sold',
            overflow: TextOverflow.ellipsis,
            style: getMediumStyle
                .copyWith(fontSize: 18),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Image.asset(
          AppImages.rate,
          width: 30,
        ),
        const SizedBox(
          width:4,
        ),
        Expanded(
          child: Text(
            productRating,
            overflow: TextOverflow.ellipsis,
            style:
            getMediumStyle
                .copyWith(fontSize: 14),
          ),
        ),
        ProductCounter(add: (_) {}, remove: (_) {}, productCounter: 1)
      ],
    );
  }
}
