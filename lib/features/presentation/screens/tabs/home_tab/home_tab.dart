import 'dart:async';
import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/core/utils/images_app.dart';
import 'package:e_commerce/core/widgets/product_list.dart';
import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:e_commerce/features/di/di.dart';
import 'package:e_commerce/features/domain/mappers/product_mapper.dart';
import 'package:e_commerce/features/domain/models/category.dart';
import 'package:e_commerce/features/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:e_commerce/features/presentation/cubit/home_cubit/home_cubit_state.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/categories.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/home_widgets/categories_list_widget.dart';
import '../../../../../core/widgets/home_widgets/custom_ads_widget.dart';

class HomeTab extends StatefulWidget {
   const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0 ;
  late Timer timer ;

  List<String> adsImages = [
    AppImages.carouselSlider1,
    AppImages.carouselSlider2,
    AppImages.carouselSlider3,
  ];

  late HomeCubit cubit = BlocProvider.of(context);


  @override
   void initState() {
     super.initState();
     _startImageSwitching();
   }

   void _startImageSwitching() {
     timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
       setState(() {
         currentIndex = (currentIndex + 1) % adsImages.length;
       });
     });
   }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(7),
          padding: const EdgeInsets.all(7),
          child:  Column(
            children: [
              CustomAdsWidget(adsImages: adsImages, currentIndex: currentIndex, timer: timer,),
              const SizedBox(height: 10,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const Text('Categories',style: TextStyle(color: AppColor.primary),),
                InkWell(
                    onTap: (){

                    },
                    child: const Text('view all',style: TextStyle(color: AppColor.primary),)),
              ],),
              const SizedBox(height: 10,),
              SizedBox(
                height: 270,
                child: buildGridView(),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Most selling Products',style: TextStyle(color: AppColor.primary),),
                  InkWell(
                      onTap: (){
                      },
                      child: const Text('view all',style: TextStyle(color: AppColor.primary),)),
                ],),
              const SizedBox(height: 10,),
              buildProductList(),



            ],
          ),
        ),
      ),

    );
  }

  Widget buildProductList() {
    return BlocBuilder<HomeCubit,HomeCubitState>(
      bloc: cubit,
      builder: (context , state){
        if(state.productsApiState is BaseSuccessState<List<Product>>){
          List<Product> successProductState =
          (state.productsApiState as BaseSuccessState<List<Product>>).data ;
          return  SizedBox(
            child: SizedBox(
              height: 360,
              child: ListView.builder(
                itemCount: successProductState.length,
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index){
                    return ProductCard(product: successProductState[index]);
                  },
                  ),
            ) ,);
        }else if(state.productsApiState is BaseErrorState){
          return ErrorWidget((state.productsApiState as BaseErrorState).failure.errorMsg);
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },

    );
  }

  Widget buildGridView() {
    return BlocBuilder<HomeCubit,HomeCubitState>(
      bloc: cubit,
      builder: (context,state){
        if(state.categoriesApiState is BaseSuccessState){
          BaseSuccessState<List<Category>> successState =
              state.categoriesApiState as BaseSuccessState<List<Category>>;
          return GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: successState.data.length ,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context , index){
              return  CategoriesListWidget(category:successState.data[index] ,);
            },
          );
        } else if(state.categoriesApiState is BaseErrorState){
          BaseErrorState errorState = state.categoriesApiState as BaseErrorState;
          return ErrorWidget(errorState.failure.errorMsg);
        }else {
          return const Center(child: CircularProgressIndicator());
        }
      },

    );
  }
}
