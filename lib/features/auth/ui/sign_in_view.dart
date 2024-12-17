import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/helper/spacing.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_assets.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/features/auth/data/cubit/sign_in_cubit.dart';
import 'package:weather/features/auth/widgets/custom_sign_in_form.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLightBlue,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state is SignInSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.homePageRoute, (route) => false);
              } else if (state is SignInFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errMessage),
                ));
              }
            },
            builder: (context, state) {
              return state is SignInLoading
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        verticalSpace(80),
                        Image.asset(
                          AppAssets.assetsIconsCloudy,
                          width: 120.w,
                        ),
                        verticalSpace(50),
                        CustomSignInForm(),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
