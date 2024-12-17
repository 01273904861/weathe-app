import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/helper/spacing.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_text_style.dart';

import 'package:weather/features/auth/data/cubit/sign_in_cubit.dart';
import 'package:weather/features/auth/widgets/custom_button.dart';
import 'package:weather/features/auth/widgets/custom_text_form_field.dart';
import 'package:weather/features/auth/widgets/dont_have_an_account.dart';

class CustomSignInForm extends StatefulWidget {
    CustomSignInForm({super.key});
   
  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignInForm> {
  final TextEditingController emailController = TextEditingController();
   bool obsecure =false;  
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signIn = context.read<SignInCubit>();
    return Form(
        key: signIn.signInFormKey,
        child: Column(
          children: [
            CustomTextFormField(
             
                hintTextStyle: const TextStyle(color: Colors.black),
                hintText: 'Email',
                controller: signIn.emailController),
            verticalSpace(20),
            CustomTextFormField(
              obscureText: obsecure,
              suffixIcon: InkWell(
                onTap: () {
                  obsecure = !obsecure;
                  setState(() {
                    
                  });
                },
                child: Icon(obsecure? Icons.visibility_off : Icons.visibility)) ,
                hintTextStyle: const TextStyle(color: Colors.black),
                hintText: 'Password',
                controller: signIn.passwordController),
            verticalSpace(50),
            CustomButton(
              onPressed: () {
                if (signIn.signInFormKey.currentState!.validate()) {
                  signIn.signIn();
                }
              },
              height: 30,
              width: 275,
              title: 'sign in',
              titleStyle: AppTextStyle.font18WhiteBold,
              backgroungColor: const Color.fromARGB(255, 171, 160, 62),
            ),
            verticalSpace(20),
            DontHaveAnAccount(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.signUpRoute);
              },
            ),
          ],
        ));
  }
}
