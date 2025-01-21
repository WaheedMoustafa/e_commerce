import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:e_commerce/features/domain/models/category.dart';
import 'package:e_commerce/features/presentation/screens/tabs/home_tab/cubit/home_cubit.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/categories_widgets/categories_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home_tab/cubit/home_cubit_state.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});
  static const String routeName = 'categoriesList';


  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xDCE1EBFF),
            border: Border(
              // set the border for only 3 sides
                top: BorderSide(
                    width: 8,
                    color: AppColor.primary.withOpacity(0.3)),
                left: BorderSide(
                    width: 8,
                    color: AppColor.primary.withOpacity(0.3)),
                bottom: BorderSide(
                    width: 8,
                    color: AppColor.primary.withOpacity(0.3))),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),

          // the categories items list
          child: ClipRRect(
            // clip the corners of the container that hold the list view
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: buildCategoriesListView(),
          ),
        ));
  }

  Widget buildCategoriesListView() {
    return BlocBuilder<HomeCubit,HomeCubitState>(
    builder: (context , state){
        if(state.categoriesApiState is BaseSuccessState<List<Category>>){
          List<Category> successState =
          (state.categoriesApiState as BaseSuccessState<List<Category>>).data ;
          return ListView.builder(
                    itemCount: successState.length,
                    itemBuilder: (context, index) => CategoryItem(index,
                        successState[index] , selectedIndex == index, onItemClick),
                  );
        }else if(state.categoriesApiState is BaseErrorState){
          return ErrorWidget((state.categoriesApiState as BaseErrorState).failure.errorMsg);
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
    },


    );
  }

  // callback function to change the selected index
  onItemClick( Category category, int index) {
    BlocProvider.of<HomeCubit>(context).onSelectedCategoryPressed(category);
    setState(() {
      selectedIndex = index;
    });
  }
}
