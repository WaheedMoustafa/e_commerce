import 'package:e_commerce/core/utils/color_app.dart';
import 'package:e_commerce/core/utils/images_app.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/main_text_field.dart';

class Account extends StatefulWidget {
  const Account({super.key});
  static const String routeName = 'account';

  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<Account> {
  bool isFullNameReadOnly = true;
  bool isEmailReadOnly = true;
  bool isPasswordReadOnly = true;
  bool isMobileNumberReadOnly = true;
  bool isAddressReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.routeImg,
                height: 40,
                color:  AppColor.primary,
              ),
              const SizedBox(height: 20 ),
              const Text(
                'Welcome, waheed',
                style:  TextStyle(
                    color: AppColor.primary, fontSize: 18),
              ),
              Text(
                'waheedmoustafa1@gmail.com',
                style:  TextStyle(
                    color: AppColor.primary.withOpacity(.5),
                    fontSize: 14),
              ),
              const SizedBox(height: 18),
              BuildTextField(
                borderBackgroundColor: AppColor.primary.withOpacity(.5),
                readOnly: isFullNameReadOnly,
                backgroundColor: AppColor.white,
                hint: 'Enter your full name',
                label: 'Full Name',
                controller:
                TextEditingController(text: 'Waheed'),
                labelTextStyle: const TextStyle(
                    color: AppColor.primary, fontSize: 18),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isFullNameReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.text,
                hintTextStyle: const TextStyle(color: AppColor.primary)
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(height: 18),
              BuildTextField(
                borderBackgroundColor: AppColor.primary.withOpacity(.5),
                readOnly: isEmailReadOnly,
                backgroundColor: AppColor.white,
                hint: 'Enter your email address',
                label: 'E-mail address',
                controller: TextEditingController(text: 'mohamed.N@gmail.com'),
                labelTextStyle: const TextStyle(
                    color: AppColor.primary, fontSize: 18),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEmailReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.emailAddress,
                hintTextStyle: const TextStyle(color: AppColor.primary)
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(height: 18),
              BuildTextField(
                onTap: () {
                  setState(() {
                    isPasswordReadOnly = false;
                  });
                },
                controller: TextEditingController(text: '123456789123456'),
                borderBackgroundColor: AppColor.primary.withOpacity(.5),
                readOnly: isPasswordReadOnly,
                backgroundColor: Colors.white,
                hint: 'Enter your password',
                label: 'Password',
                isObscured: true,
                labelTextStyle: const TextStyle(
                    color: AppColor.primary, fontSize: 18),
                suffixIcon: const Icon(Icons.edit),
                textInputType: TextInputType.text,
                hintTextStyle: const TextStyle(color: AppColor.primary)
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(height: 18),
              BuildTextField(
                controller: TextEditingController(text: '01122118855'),
                borderBackgroundColor: AppColor.primary.withOpacity(.5),
                readOnly: isMobileNumberReadOnly,
                backgroundColor: AppColor.white,
                hint: 'Enter your mobile no.',
                label: 'Your mobile number',
                labelTextStyle: const TextStyle(
                    color: AppColor.primary, fontSize: 18),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isMobileNumberReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.phone,
                hintTextStyle: const TextStyle(color: AppColor.primary)
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(height: 18),
              BuildTextField(
                controller:
                TextEditingController(text: '6th October, street 11.....'),
                borderBackgroundColor: AppColor.primary.withOpacity(.5),
                readOnly: isAddressReadOnly,
                backgroundColor: Colors.white,
                hint: '6th October, street 11.....',
                label: 'Your Address',
                labelTextStyle: const TextStyle(
                    color: AppColor.primary, fontSize: 18),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isAddressReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.streetAddress,
                hintTextStyle: const TextStyle(color: AppColor.primary)
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}