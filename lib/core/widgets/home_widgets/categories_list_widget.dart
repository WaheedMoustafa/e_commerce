import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/features/domain/models/category.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/images_app.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key , required this.category});
 final  Category category ;


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CachedNetworkImage(
          height: 100,
          width: 100,
          fit: BoxFit.cover,
          imageUrl: category.image ?? '',
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 8,),
         Text(category.name! ?? '',
          style: const TextStyle(color: AppColor.primary, fontSize: 14),
        ),

      ],
    );
  }
}
