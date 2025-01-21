import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:e_commerce/features/domain/mappers/product_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/presentation/screens/tabs/cart/cubit/cart_cubit.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product ;
  final TextStyle getRegularStyle = const TextStyle(fontSize: 12 , color: AppColor.primary) ;
  final TextStyle getMediumStyle = const TextStyle(fontSize: 16 , color: AppColor.primary);
  final TextStyle getTextWithLine = const TextStyle(fontSize: 12 , fontWeight: FontWeight.w400 ,
      decoration: TextDecoration.lineThrough, color: AppColor.primary);

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 4) {
      return title;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 200,
      height: 280,
      child: Container(
        width: 280,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: AppColor.primary.withOpacity(0.8),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: CachedNetworkImage(
                    imageUrl: product.imageCover ?? "",
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      truncateTitle(product.title),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      truncateTitle(product.description),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EGP ${product.price}",
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getRegularStyle,
                        ),
                        Text(
                          "${product.price} EGP ",
                          style: getTextWithLine,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Reviews",
                              style: getRegularStyle,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${product.ratingsAverage}",
                              style: getRegularStyle,
                            ),
                          ],
                        ),
                        BlocBuilder<CartCubit,BaseApiState>(
                          builder: (context , state){
                            CartCubit cubit = BlocProvider.of(context, listen: false);
                            bool isInCart = cubit.isInCart(product.id);
                            return  InkWell(
                              onTap: () {
                                if(isInCart){
                                  cubit.removeFromCart(product.id);
                                }else{
                                  cubit.addToCart(product.id);
                                }
                              },
                              child: Icon(
                                isInCart ? Icons.remove_circle_rounded : Icons.add_circle_rounded,
                                color: AppColor.primary,
                                size: 26,
                              ),
                            );
                          },

                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}