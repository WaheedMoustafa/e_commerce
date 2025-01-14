import 'package:e_commerce/core/utils/color_app.dart';
import 'package:flutter/material.dart';

class SizeWidget extends StatelessWidget {
  const SizeWidget(
      {super.key,
      required this.index,
      required this.sizeNumber,
      required this.selectedIndex});
  final int sizeNumber;
  final int index;
  final int selectedIndex;


  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor:
          index == selectedIndex ? AppColor.primary : Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 9
        ),
        child: Text(
          '$sizeNumber',
          style: TextStyle (
                  color: index == selectedIndex
                      ?  AppColor.white
                      :  AppColor.primary,  fontSize: 18),
        ),
      ),
    );
  }
}
