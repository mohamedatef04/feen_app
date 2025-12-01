import 'package:feen_app/core/constants/app_strings.dart';
import 'package:feen_app/core/utils/app_colors.dart';
import 'package:feen_app/core/utils/app_text_styles.dart';
import 'package:feen_app/core/widgets/logo_widget.dart';
import 'package:feen_app/features/auth/presentation/views/login_view.dart';
import 'package:feen_app/features/auth/presentation/widgets/success_icon_widget.dart';
import 'package:feen_app/features/auth/presentation/widgets/success_message_widget.dart';
import 'package:feen_app/features/get_started/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SuccessRegistrationView extends StatelessWidget {
  const SuccessRegistrationView({super.key});

  static const String routeName = '/success-registration';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                // Logo
                LogoWidget(height: 100.h),

                // Success Icon
                const SuccessIconWidget(),

                // Success Message
                Column(
                  children: [
                    const SuccessMessageWidget(
                      message: AppStrings.successfulRegistrationForPassenger,
                    ),

                    // Thank you message
                    Text(
                      AppStrings.thanksForUsingOurApp,
                      style: AppTextStyles.bold20(context),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                // Exit Button
                CustomButtonWidget(
                  backgroundColor: AppColors.primary,
                  onPressed: () {
                    GoRouter.of(context).go(LoginView.routeName);
                  },
                  child: Text(
                    AppStrings.backToLogin,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bold16(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
