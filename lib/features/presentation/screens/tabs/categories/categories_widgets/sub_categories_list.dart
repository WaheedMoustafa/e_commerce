import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/core/utils/images_app.dart';
import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:e_commerce/features/domain/models/category.dart';
import 'package:e_commerce/features/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:e_commerce/features/presentation/cubit/home_cubit/home_cubit_state.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/categories_widgets/categories_card_item.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/categories_widgets/sub_categories_item.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SubCategoriesList extends StatefulWidget {
  const SubCategoriesList({super.key});

  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeCubitState>(
      builder: (context , state){
        return  Expanded(
          flex: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              // category title
               SliverToBoxAdapter(
                child: Text(
                  state.selectedCategory!.name ?? '',
                  style: const TextStyle(
                      color: AppColor.primary, fontSize: 14),
                ),
              ),
              // the category card
              SliverToBoxAdapter(
                child: CategoryCardItem(state.selectedCategory!.name?? '',
                    AppImages.carouselSlider4, goToCategoryProductsListScreen
                ),
              ),
              // the grid view of the subcategories
              buildSliverGrid(state.subCategoriesApiState),
            ],
          ),
        );

      },
    );
  }

  Widget buildSliverGrid(BaseApiState subCategory) {
    if(subCategory is BaseSuccessState<List<Category>>){
      return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: subCategory.data.length,
                (context, index) => SubCategoryItem(
                subCategory.data[index].name ?? '',
                AppImages.subCategoryItem,
                //Api Doesn't have images
                goToCategoryProductsListScreen,
            ),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.75,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ));
    }else if(subCategory is BaseErrorState){
      return SliverToBoxAdapter(child: ErrorWidget(subCategory.failure.errorMsg),);
    }else{
      return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),),);
    }
  }

  goToCategoryProductsListScreen() {
       Navigator.pushNamed(context, ProductList.routeName,
           arguments: BlocProvider.of<HomeCubit>(context).state.selectedCategory!.id);
  }
}
