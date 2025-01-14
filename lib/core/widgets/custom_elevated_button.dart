import 'package:e_commerce/core/utils/color_app.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final double? radius;
  final void Function() onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;

  const CustomElevatedButton(
      {super.key,
      this.prefixIcon,
      this.textStyle,
      this.isStadiumBorder = true,
      this.backgroundColor,
      this.radius,
      this.suffixIcon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: isStadiumBorder
              ? const StadiumBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)),
          backgroundColor: backgroundColor ?? AppColor.primary,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox(),
            const SizedBox(
              width: 24,
            ),
            Text(
              label,
              style: textStyle ??
                  const TextStyle(color: AppColor.white,fontSize: 20),
            ),
            const SizedBox(
              width: 27,
            ),
            suffixIcon ?? const SizedBox()
          ],
        ));
  }
}
