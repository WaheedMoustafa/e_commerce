
import 'package:e_commerce/core/utils/color_app.dart';
import 'package:flutter/material.dart';

import '../utils/images_app.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final num price;
  final String description;
  final num priceBeforeDiscound;
  final num rating;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.priceBeforeDiscound,
    required this.description,
  });
  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 4) {
      return title;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 200,
      height: 280,
      child: Container(
        width: 280,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: AppColor.primary.withOpacity(0.8),
          ),
        ),
        child: Column(
          children: [
            // Expanded(
            //   flex: 1,
            //   child: ClipRRect(
            //     borderRadius: const BorderRadius.only(
            //       topLeft: Radius.circular(24),
            //       topRight: Radius.circular(24),
            //     ),
            //     child: AspectRatio(
            //       aspectRatio: 16 / 9,
            //       child: CachedNetworkImage(
            //         imageUrl: product.imageCover ?? "",
            //         fit: BoxFit.fill,
            //         placeholder: (context, url) =>
            //             const Center(child: CircularProgressIndicator()),
            //         errorWidget: (context, url, error) =>
            //             const Center(child: Icon(Icons.error)),
            //       ),
            //     ),
            //   ),
            // ),

            Expanded(
              flex: 1,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: height,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.01,
                    right: width * 0.02,
                    child: Container(
                      height: height * 0.036,
                      width: width * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          AppImages.isWishList,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      truncateTitle(title),
                      style: const TextStyle(
                        color: AppColor.primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      truncateTitle(description),
                      style: const TextStyle(
                        color: AppColor.primary,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EGP $price",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColor.primary,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "$priceBeforeDiscound EGP ",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Reviews",
                              style:  TextStyle(
                                color: AppColor.primary,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "$rating",
                              style: const TextStyle(
                                color: AppColor.primary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.add_circle_rounded,
                            color: AppColor.primary,
                            size: 36,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
