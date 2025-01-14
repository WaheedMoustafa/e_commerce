import 'package:e_commerce/features/di/di.dart';
import 'package:e_commerce/features/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce/features/presentation/cubit/sign_up_cubit/sign_up_cubit_state.dart';
import 'package:e_commerce/features/presentation/screens/home.dart';
import 'package:e_commerce/features/presentation/screens/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/color_app.dart';
import '../../../core/utils/images_app.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../base/base_api_state.dart';
import '../../failure/failure.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const String routeName = 'signUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpCubit cubit = getIt();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: BlocListener<SignUpCubit,SignUpCubitState>(
        bloc: cubit,
        listener: (BuildContext context,state){
      if(state.registerState is BaseLoadingState){
        loadingView(context);
        Future.delayed(const Duration(seconds: 2), () {
          loadingView(context).hide(context);
        });
      }
      else if(state.registerState is BaseSuccessState){
        Navigator.pushReplacementNamed(context, SignIn.routeName);
      }
      else if(state.registerState is BaseErrorState){
        Failure failure = (state.registerState as BaseErrorState).failure ;
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
                const SizedBox(height: 40,),
                const Text('Full Name',style: TextStyle(fontSize: 18,color: AppColor.white ,fontWeight: FontWeight.w500)),
                const SizedBox(height: 20,),
                TextField(
                  controller: nameController,
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
                      hintText: 'enter your full name',hintStyle: const TextStyle(color: AppColor.hint ,fontSize: 15)),),
                const SizedBox(height: 20,),
                const Text('Mobile Number',style: TextStyle(fontSize: 18,color: AppColor.white,fontWeight: FontWeight.w500)),
                const SizedBox(height: 20,),
                TextField(
                  controller: phoneController,
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
                      hintText: 'enter your mobile no',hintStyle: const TextStyle(color: AppColor.hint,fontSize: 15)
                  ),),
                const SizedBox(height: 20,),
                const Text('E-mail address',style: TextStyle(fontSize: 18,color: AppColor.white,fontWeight: FontWeight.w500)),
                const SizedBox(height: 20,),
                TextField(
                  controller: emailController,
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
                      hintText: 'enter your e-mail address',hintStyle: const TextStyle(color: AppColor.hint,fontSize: 15)
                  ),),
                const SizedBox(height: 20,),
                const Text('Password',style: TextStyle(fontSize: 18,color: AppColor.white,fontWeight: FontWeight.w500)),
                const SizedBox(height: 20,),
                TextField(
                  controller: passwordController,
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
                  ),),
                const SizedBox(height: 48,),

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
                      cubit.register(nameController.text, phoneController.text, emailController.text, passwordController.text);
                      Navigator.pushNamed(context, Home.routeName);
                    },
                    child: const Text('Sign Up',style: TextStyle(fontSize: 20,color: AppColor.primary),),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
