import 'package:e_commerce/core/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';


class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key , required this.productDescription});
  final String productDescription;
  final TextStyle getMediumStyle = const TextStyle(fontSize: 14 , color: AppColor.primary);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: getMediumStyle
              .copyWith(fontSize: 18),
        ),
        const SizedBox(
          height: 8,
        ),
        ReadMoreText(
        productDescription,
          style: getMediumStyle
              .copyWith(fontSize: 18),
          trimExpandedText: ' Read Less',
          trimCollapsedText: ' Read More',
          trimLines: 3,
          trimMode: TrimMode.Line,
          colorClickableText: AppColor.primary,
        ),
        const SizedBox(height: 16,),
      ],
    );
  }
}
