import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({super.key, required this.items, required this.initialIndex});
  final List<Widget> items;
  final int initialIndex;

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: widget.items,
          options: CarouselOptions(
            aspectRatio: 199/150,
            initialPage: widget.initialIndex,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: widget.items.length,
            duration: const Duration(microseconds: 0),
            effect: ExpandingDotsEffect(
              dotWidth: 7,
              dotHeight: 7,
              dotColor: Colors.grey.shade400,
              paintStyle: PaintingStyle.fill,
              activeDotColor: AppColor.primary,
            ),
          ),
        ),
      ],
    );
  }
}
