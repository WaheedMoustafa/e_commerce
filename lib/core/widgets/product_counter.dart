import 'package:flutter/material.dart';

import '../utils/color_app.dart';

class ProductCounter extends StatelessWidget {
  final num productCounter;
  final void Function(num) add;
  final void Function(num) remove;
  const ProductCounter(
      {super.key,
      required this.add,
      required this.remove,
      required this.productCounter});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                remove.call(productCounter);
              },
              child: const Icon(
                Icons.remove_circle_outline,
                size: 20,
                color: AppColor.white,
              )),
          const SizedBox(
            width: 18,
          ),
          Text(
            '$productCounter',
            style: const TextStyle(color: AppColor.white,fontSize: 18),
          ),
          const SizedBox(
            width: 18,
          ),
          InkWell(
              onTap: () {
                add.call(productCounter);
              },
              child: const Icon(
                Icons.add_circle_outline,
                color: AppColor.white,
                size: 20,
              )),
        ],
      ),
    );
  }
}
