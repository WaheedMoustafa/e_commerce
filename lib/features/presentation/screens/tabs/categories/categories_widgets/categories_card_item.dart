import 'package:e_commerce/core/utils/color_app.dart';
import 'package:flutter/material.dart';

class CategoryCardItem extends StatelessWidget {
  final String title;
  final String image;
  final Function navigation;
  const CategoryCardItem(this.title, this.image, this.navigation, {super.key});

  final TextStyle getRegularStyle = const TextStyle(fontSize: 12 , color: AppColor.white) ;


  @override
  Widget build(BuildContext context) {
    // Create a container for the category card
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      // Height of the card set with fixed size to make all image same size but it can be deleted without affecting the code
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Background image for the category
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            // Overlay with category title and button
            Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Category title
                              Text(
                                title,
                                style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 16),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // Shop Now button
                              SizedBox(
                                width: 110,
                                height: 35,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(120, 30),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 0),
                                        backgroundColor: AppColor.primary,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10))),
                                    child: Text(
                                      "Shop Now",
                                      style: getRegularStyle,
                                    )),
                              )
                            ],
                          )),
                      const Spacer()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
