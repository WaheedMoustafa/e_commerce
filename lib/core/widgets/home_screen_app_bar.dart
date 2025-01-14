import 'package:e_commerce/core/utils/images_app.dart';
import 'package:flutter/material.dart';

import '../../features/presentation/screens/cart.dart';
import '../utils/color_app.dart';


class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
 final bool? automaticallyImplyLeading;
  const HomeScreenAppBar({super.key, this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading??false,
      title: Image.asset(
        AppImages.routeImg,
        height: 25,
        width: 25,
        color: AppColor.primary,
      ),
      bottom: PreferredSize(
          preferredSize: const Size(100, 60),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: AppColor.primary,
                    style: const TextStyle(
                        color: AppColor.primary, fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: const BorderSide(
                              width: 1, color: AppColor.primary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide:const  BorderSide(
                              width: 1, color: AppColor.primary)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide:  const BorderSide(
                              width: 1, color: AppColor.primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: const BorderSide(
                              width: 1, color: AppColor.primary)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: const BorderSide(
                              width: 1, color: Colors.red)),
                      prefixIcon: const Icon(
                      Icons.search,
                        color: AppColor.primary,
                      ),
                      hintText: "what do you search for?",
                      hintStyle: const TextStyle(
                          color: AppColor.primary, fontSize: 16),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, Cart.routeName),
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      color: AppColor.primary,
                    ))
              ],
            ),
          )),
      // leading: const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => const Size(0, 130);
}
