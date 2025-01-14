import 'package:e_commerce/core/shared_pref_utils.dart';
import 'package:e_commerce/features/di/di.dart';
import 'package:e_commerce/features/presentation/screens/sign_in.dart';
import 'package:e_commerce/features/presentation/screens/sign_up.dart';
import 'package:e_commerce/features/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'features/presentation/screens/cart.dart';
import 'features/presentation/screens/home.dart';
import 'features/presentation/screens/tabs/categories/categories.dart';
import 'features/presentation/screens/tabs/categories/product/product_details/product_details.dart';
import 'features/presentation/screens/tabs/categories/product/product_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  SharedPrefUtils sharedPrefUtils = getIt();
  bool isLoggedIn = (await sharedPrefUtils.getToken()) != null;
  runApp( MyApp(isLoggedIn: isLoggedIn,));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key ,required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routeName : (_)=> Home(),
        Cart.routeName : (_)=> Cart(),
        Categories.routeName : (_)=> Categories(),
        ProductDetails.routeName : (_)=> ProductDetails(),
        ProductList.routeName : (_)=> ProductList(),
        SignIn.routeName : (_)=> SignIn(),
        SignUp.routeName : (_)=> SignUp(),
        SplashScreen.routeName : (_)=> SplashScreen(),

      },
      initialRoute: isLoggedIn? Home.routeName: SplashScreen.routeName,
    );
  }
}


