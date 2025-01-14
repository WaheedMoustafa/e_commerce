import 'package:e_commerce/core/widgets/product_list.dart';
import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:e_commerce/features/di/di.dart';
import 'package:e_commerce/features/presentation/cubit/product_list_cubit/product_list_cubit.dart';
import 'package:e_commerce/features/presentation/cubit/product_list_cubit/product_list_cubit_state.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/home_screen_app_bar.dart';
import '../../../../../domain/mappers/product_mapper.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key });
  static const String routeName = 'product list';

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  Widget build(BuildContext context) {
    String args = ModalRoute.of(context)!.settings.arguments as String ;

    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<ProductListCubit,ProductListCubitState>(
          bloc: getIt<ProductListCubit>()..loadProducts(args),
          builder: (context , state){
            if(state.productListApiState is BaseSuccessState){
              List<Product> products =
              (state.productListApiState as BaseSuccessState<List<Product>>).data;

              return buildProductList(products);

            }else if(state.productListApiState is BaseErrorState){
              return ErrorWidget(state);
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
           ),
    );
  }

  Widget buildProductList(List<Product> product) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: product.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 7 / 9,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, ProductDetails.routeName ,
                          arguments: product[index] );
                    },
                    child: ProductCard(product: product[index]));
              },
              scrollDirection: Axis.vertical,
            ),
          )
        ],
      ),
    );
  }
}
