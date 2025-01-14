import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../core/widgets/heart_button.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.imageUrl, this.onTap});
  final String imageUrl;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, image) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.topRight,
        child: HeartButton(
          onTap: onTap,
        ),
      ),
    );
  }
}
