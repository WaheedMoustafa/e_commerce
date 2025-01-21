import 'package:e_commerce/core/utils/images_app.dart';
import 'package:e_commerce/features/presentation/screens/tabs/cart/widgets/cart_item_widget.dart';
import 'package:e_commerce/features/presentation/screens/tabs/cart/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/color_app.dart';
import '../../../../base/base_api_state.dart';
import '../../../../domain/models/cart.dart';
import 'cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const String routeName='cart';
  @override
  Widget build(BuildContext context) {
    CartCubit cubit = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 20, color: AppColor.primary),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppColor.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColor.primary,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartCubit,BaseApiState>(
        builder: (context,state){
          if(state is BaseSuccessState){
            Cart cart = (state as BaseSuccessState<Cart>).data;
            return  Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  Expanded(
                    // the list of cart items ===============
                    child: ListView.builder(
                      itemBuilder: (context, index) => CartItemWidget(
                        imagePath: AppImages.categoryItem,
                        title: cart.products[index].title,
                        price: cart.products[index].price,
                        quantity: cart.products[index].quantity,
                        onDeleteTap: () {
                          cubit.removeFromCart(cart.products[index].id);
                        },
                        onDecrementTap: (quantity) {
                          cubit.updateCart(cart.products[index].id, quantity-- );
                        },
                        onIncrementTap: (quantity) {
                          cubit.updateCart(cart.products[index].id, quantity++ );
                        },
                        size: 40,
                        color: Colors.black,
                        colorName: 'Black',
                      ),
                      itemCount: cart.products.length,
                    ),
                  ),
                  // the total price and checkout button========
                  TotalPriceAndCheckoutButton(
                    totalPrice: cart.totalPrice,
                    checkoutButtonOnTap: () {},
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );

          }
           if(state is BaseErrorState){
             return ErrorWidget(state);
           }
           else {
             return const CircularProgressIndicator();
           }
         },
      ),
    );
  }
}
