import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/core/utils/images_app.dart';
import 'package:e_commerce/features/di/di.dart';
import 'package:e_commerce/features/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:e_commerce/features/presentation/screens/tabs/account.dart';
import 'package:e_commerce/features/presentation/screens/tabs/categories/categories.dart';
import 'package:e_commerce/features/presentation/screens/tabs/home_tab/home_tab.dart';
import 'package:e_commerce/features/presentation/screens/tabs/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
   Home({super.key});
  static const String routeName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0 ;
  List<Widget> tabs = [HomeTab(),Categories(),WishList(),Account()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> getIt<HomeCubit>()..loadCategories()..loadProducts(),
      child: Scaffold(
        appBar: buildAppBar(),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: AppColor.primary ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex ,
            onTap: onItemTapped,
            items : const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.heart_broken_rounded),label: 'Favourites'),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account'),
            ],),
        ),
        body: tabs[selectedIndex],


      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: AppBar(
        backgroundColor: AppColor.white,
        title: Image.asset(AppImages.routeAppBar,height: 35,),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Row(
            children: [
              const Expanded(
                  flex: 1,
                  child: SizedBox(width: 10,)),
              Expanded(
                flex: 8,
                child: TextField( decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                        hintText: 'What do you search for',
                        hintStyle: const TextStyle(color: AppColor.hint),
                         focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25),
                             borderSide: const BorderSide(color: AppColor.primary)
                         ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: AppColor.backgroundColor)
                  ),
                         filled: true,
                         fillColor: AppColor.white,
                  prefixIcon: const Icon(Icons.search,color: AppColor.backgroundColor,)
                       )),
              ),
              const Expanded(
                  flex: 1,
                  child: Icon(Icons.shopping_cart_outlined,color: AppColor.backgroundColor,))
            ],
          ),
        ),


      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index ;

    });
  }
}
