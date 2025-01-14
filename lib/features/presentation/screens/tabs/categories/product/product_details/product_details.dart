import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/features/domain/mappers/product_mapper.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_details/product_details_widgets/product_color.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_details/product_details_widgets/product_description.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_details/product_details_widgets/product_item.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_details/product_details_widgets/product_label.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_details/product_details_widgets/product_rating.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_details/product_details_widgets/product_size.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_details/product_details_widgets/product_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/custom_elevated_button.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});
  static const String routeName = 'product details';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final TextStyle getMediumStyle = const TextStyle(fontSize: 14 , color: AppColor.primary);

  @override
  Widget build(BuildContext context) {
    Product args = ModalRoute.of(context)!.settings.arguments as Product ;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle
              .copyWith(fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColor.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: AppColor.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
             ProductSlider(
                 items: args.images.map((imageUrl)=> ProductItem(imageUrl: imageUrl,)).toList()
                 , initialIndex: 0),
            const SizedBox(
              height: 24,
            ),
             ProductLabel(
                productName: args.title , productPrice: '${args.price}'),
            const SizedBox(
              height: 16,
            ),
             ProductRating(
                productBuyers: 'unKnown', productRating: '${args.ratingsAverage} ${args.ratingsQuantity}'),
            const SizedBox(
              height: 16,
            ),
             ProductDescription(
                productDescription: args.description),
            ProductSize(
              size: const [35, 38, 39, 40],
              onSelected: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Color',
                style: getMediumStyle
                    .copyWith(fontSize: 18)),
            ProductColor(color: const [
              Colors.red,
              Colors.blueAccent,
              Colors.green,
              Colors.yellow,
            ], onSelected: () {}),
            const SizedBox(
              height: 48,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: getMediumStyle
                          .copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text('EGP 3,500',
                        style:
                        getMediumStyle
                            .copyWith(fontSize: 18))
                  ],
                ),
                const SizedBox(
                  width: 33,
                ),
                Expanded(
                  child: CustomElevatedButton(
                    label: 'Add to cart',
                    onTap: () {},
                    prefixIcon: const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: AppColor.white,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}