import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/core/utils/images_app.dart';
import 'package:e_commerce/features/presentation/screens/auth/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, SignIn.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(children:[
        Center(child: Image.asset(AppImages.splashBG,)),
        Container(
            alignment: Alignment.center,
            child: Image.asset(AppImages.splashImg ,))
      ],),
    );
  }
}
