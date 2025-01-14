
import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/color_app.dart';

class ProductLabel extends StatelessWidget {
  const ProductLabel({super.key , required this.productName , required this.productPrice});
final String productName;
final String productPrice;
  final TextStyle getMediumStyle = const TextStyle(fontSize: 14 , color: AppColor.primary);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
             productName,
              style: getMediumStyle
                  .copyWith(fontSize: 18),
            )),
        Text(
          productPrice,
          style: getMediumStyle
              .copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
