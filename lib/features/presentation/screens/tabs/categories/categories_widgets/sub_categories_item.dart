import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_list.dart';
import 'package:flutter/material.dart';

class SubCategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final void Function() navigation;
  const SubCategoryItem(this.title, this.image, this.navigation, {super.key});

  final TextStyle getRegularStyle = const TextStyle(fontSize: 12 , color: AppColor.primary);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigation(),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.primary, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: getRegularStyle,
          )
        ],
      ),
    );
  }
}