
import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_details/product_details.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/widgets/heart_button.dart';

class CustomProductWidget extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;

  const CustomProductWidget({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
  });

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetails.routeName),
      child: Container(
        width: width * 0.4,
        height: height * 0.3,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.primary.withOpacity(0.3),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  // Not working with the lastest flutter version

                  // CachedNetworkImage(
                  //   imageUrl: image,
                  //   height: height * 0.15,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  //   placeholder: (context, url) =>
                  //       const Center(child: CircularProgressIndicator()),
                  //   errorWidget: (context, url, error) => const Icon(Icons.error),
                  // ),
                  // Image.network(
                  //   image,
                  //   fit: BoxFit.cover,
                  // ),
                  ClipRRect(
                    borderRadius:
                       const BorderRadius.vertical(top: Radius.circular(14)),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: width,
                    ),
                  ),
                  Positioned(
                      top: height * 0.01,
                      right: width * 0.02,
                      child: HeartButton(onTap: () {})),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      truncateTitle(title),
                      style: const TextStyle(
                        color: AppColor.primary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: height * 0.002),
                    Text(
                      truncateDescription(description),
                      style: const TextStyle(
                        color: AppColor.primary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    SizedBox(
                      width: width * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "EGP $price",
                            style: const TextStyle(
                              color: AppColor.primary,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "$discountPercentage %",
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // width: width * 0.22,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Review ($rating)",
                                style: const TextStyle(
                                  color: AppColor.primary,
                                  fontSize: 12,
                                ),
                              ),
                              const Icon(
                                Icons.star_rate_rounded,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: height * 0.036,
                              width: width * 0.08,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primary,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
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
