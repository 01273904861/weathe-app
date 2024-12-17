import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/helper/spacing.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_text_style.dart';
import 'package:weather/features/auth/data/cubit/sign_up_cubit.dart';
import 'package:weather/features/auth/widgets/already_have_an_account.dart';
import 'package:weather/features/auth/widgets/custom_button.dart';
import 'package:weather/features/auth/widgets/custom_text_form_field.dart';

class CustomSignUpForm extends StatefulWidget {
 const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
 bool obsecure = false;
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signUp = context.read<SignUpCubit>();
    return Form(
        key: signUp.signUpFormKey,
        child: Column(
          children: [
            CustomTextFormField(
                hintTextStyle: const TextStyle(color: Colors.black),
                hintText: 'name',
                controller: nameController),
            verticalSpace(20),
            CustomTextFormField(
                hintTextStyle: const TextStyle(color: Colors.black),
                hintText: 'email',
                controller: signUp.emaillController),
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
                controller: signUp.passwordController),
            verticalSpace(50),
            CustomButton(
              onPressed: () {
                if (signUp.signUpFormKey.currentState!.validate()) {
                  signUp.signUp();
                } else {}
              },
              height: 30,
              width: 275,
              title: 'sign up',
              titleStyle: AppTextStyle.font18WhiteBold,
              backgroungColor: const Color.fromARGB(255, 171, 160, 62),
            ),
            verticalSpace(20),
            AlreadyHaveAnAccount(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.signInRoute);
              },
            ),
          ],
        ));
  }
}
