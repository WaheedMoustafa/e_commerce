import 'package:e_commerce/core/utils/color_app.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({required this.onPressed, required this.text, super.key});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 36,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.symmetric(horizontal: 1),
              backgroundColor: AppColor.primary),
          onPressed: onPressed,
          child: Text(text,
              style: const TextStyle(
                color: AppColor.white,
                fontSize: 14,
              ))),
    );
  }
}
