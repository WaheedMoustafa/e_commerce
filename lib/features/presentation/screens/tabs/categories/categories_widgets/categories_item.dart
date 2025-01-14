import 'package:e_commerce/core/utils/color_app.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/category.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final Category category;
  final TextStyle getMediumStyle = const TextStyle(fontSize: 14 , color: AppColor.primary);
  final bool isSelected;
  final Function onItemClick;

  const CategoryItem(this.index, this.category, this.isSelected, this.onItemClick,
      {super.key});



  @override
  Widget build(BuildContext context) {
    // Handle item click by calling onItemClick callback
    return InkWell(
      onTap: () => onItemClick(category,index),
      child: Container(
        // Set background color based on selection
        color: isSelected? AppColor.white:Colors.transparent,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            //Show/hide the indicator based on selection
            Visibility(
              visible: isSelected,
              child: Container(
                width: 8,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            // wrap the text with expanded to avoid overflow error
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 8),
                  child: Text(
                    category.name ?? '',
                    textAlign: TextAlign.start,
                    style: getMediumStyle
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
