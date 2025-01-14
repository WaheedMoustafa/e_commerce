import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../core/utils/color_app.dart';

class CustomAdsWidget extends StatelessWidget {
  final List<String> adsImages;
  final int currentIndex;
  final Timer timer;

  const CustomAdsWidget({
    super.key,
    required this.adsImages,
    required this.currentIndex,
    required this.timer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1500),
            child: Image.asset(
              height: 210,
              width: double.infinity,
              adsImages[currentIndex],
              key: ValueKey<int>(currentIndex),
            ),
          ),
          SizedBox(
            height: 210,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: adsImages.map((image) {
                int index = adsImages.indexOf(image);
                return Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? AppColor.primary
                        : AppColor.white,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}