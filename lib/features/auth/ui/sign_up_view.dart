import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/helper/spacing.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_assets.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/features/auth/data/cubit/sign_up_cubit.dart';
import 'package:weather/features/auth/widgets/custom_sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLightBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.homePageRoute, (route) => false);
              } else if (state is SignUpFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errMessage),
                ));
              }
            },
            builder: (context, state) {
              return state is SignUpLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpace(60),
                        Image.asset(
                          AppAssets.assetsIconsCloudy,
                          width: 120.w,
                        ),
                        verticalSpace(50),
                        const CustomSignUpForm(),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
