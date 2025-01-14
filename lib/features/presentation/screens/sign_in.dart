import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/core/utils/images_app.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/features/base/base_api_state.dart';
import 'package:e_commerce/features/di/di.dart';
import 'package:e_commerce/features/failure/failure.dart';
import 'package:e_commerce/features/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commerce/features/presentation/cubit/sign_in_cubit/sign_in_cubit_state.dart';
import 'package:e_commerce/features/presentation/screens/home.dart';
import 'package:e_commerce/features/presentation/screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static const String routeName = 'signIn';


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  SignInCubit cubit = getIt() ;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: BlocListener<SignInCubit,SignInCubitState>(
        bloc: cubit,
        listener: (BuildContext context, state) {
          if(state.loginState is BaseLoadingState){
            loadingView(context);
            Future.delayed(const Duration(seconds: 2), () {
              loadingView(context).hide(context);
            });
          }
          else if(state.loginState is BaseSuccessState){
            Navigator.pushReplacementNamed(context, Home.routeName);
          }
          else if(state.loginState is BaseErrorState){
            Failure failure = (state.loginState as BaseErrorState).failure ;
            showDialog(context: context,
                builder: (context){
              return CupertinoAlertDialog(
                  content: Text(failure.errorMsg),
                actions:  [
                  CupertinoDialogAction(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: const Text('ok')),
                ],
              );
                });

          }
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70,),
                Image.asset(AppImages.routeImg),
                const SizedBox(height: 70,),
                const Text('Welcome Back To Route',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: AppColor.white),),
                const Text('Please sign in with your mail',style: TextStyle(fontSize: 16,color: AppColor.white)),
                const SizedBox(height: 30,),
                const Text('User Name',style: TextStyle(fontSize: 18,color: AppColor.white ,fontWeight: FontWeight.w500)),
                const SizedBox(height: 20,),
                 TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: 'enter your name',hintStyle: const TextStyle(color: AppColor.hint ,fontSize: 15)),
                   controller: emailController,

                 ),
                const SizedBox(height: 20,),
                const Text('Password',style: TextStyle(fontSize: 18,color: AppColor.white,fontWeight: FontWeight.w500)),
                const SizedBox(height: 20,),
                 TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: 'enter your password',hintStyle: const TextStyle(color: AppColor.hint,fontSize: 15)
                  ),
                   controller: passwordController,
                 ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     InkWell(
                         onTap: (){} ,
                         child: const Text('Forgot Password',style: TextStyle(fontSize: 18,color: AppColor.white,fontWeight: FontWeight.w400))),
                  ],
                ),
                const SizedBox(height: 40,),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all(AppColor.white),
                    ),
                  onPressed: () {
                      cubit.login(emailController.text, passwordController.text);
                  },
                  child: const Text('Login',style: TextStyle(fontSize: 20,color: AppColor.primary),),),
                ),
                const SizedBox(height: 20,),
                InkWell(
                    onTap: (){Navigator.pushNamed(context, SignUp.routeName);},
                    child: const Text('Don\'t have an account? Create Account',
                        style: TextStyle(fontSize: 18,color: AppColor.white,fontWeight: FontWeight.w500))),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
