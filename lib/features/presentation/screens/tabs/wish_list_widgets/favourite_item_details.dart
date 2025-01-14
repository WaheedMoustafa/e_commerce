import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../core/utils/color_app.dart';
import 'custom_txt_widget.dart';

class FavouriteItemDetails extends StatelessWidget {
  const FavouriteItemDetails({required this.product, super.key});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextWgt(
          data: product["title"],
          textStyle:  const TextStyle(
              color: AppColor.primary, fontSize: 18),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                  color: product["color"], shape: BoxShape.circle),
            ),

          ],
        ),
        Row(
          children: [
            CustomTextWgt(
              data: 'EGP ${product["finalPrice"]}  ',
              textStyle: const TextStyle(
                      color: AppColor.primary, fontSize: 18)
                  .copyWith(
                letterSpacing: 0.17,
              ),
            ),
            product["salePrice"] == null
                ? const SizedBox.shrink()
                : Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextWgt(
                            data: 'EGP ${product["salePrice"]}',
                            textStyle: TextStyle(
                                    color: AppColor.primary
                                        .withOpacity(.6))
                                .copyWith(
                                    letterSpacing: 0.17,
                                    decoration: TextDecoration.lineThrough,
                                    color: AppColor.primary
                                        .withOpacity(.6),
                                    fontSize: 10)),
                      ],
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
