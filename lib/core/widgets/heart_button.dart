import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/core/utils/images_app.dart';
import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;
  const HeartButton({super.key, required this.onTap});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  String heartIcon = AppImages.icHeart;
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // radius: 25,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () {
        setState(() {
          isClicked = !isClicked;
          heartIcon =
              !isClicked ? AppImages.icHeart : AppImages.icClickedHeart;
          widget.onTap?.call();
        });
      },
      child: Material(
        // borderRadius: BorderRadius.circular(2),
        color: AppColor.white,
        elevation: 5,
        shape: const StadiumBorder(),
        shadowColor: AppColor.black,
        child: Padding(
            padding: const EdgeInsets.all(6),
            child: ImageIcon(
              
              AssetImage(heartIcon),
              color: AppColor.primary,
            )),
      ),
    );
  }
}
