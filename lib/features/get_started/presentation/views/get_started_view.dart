import 'package:feen_app/core/constants/app_strings.dart';
import 'package:feen_app/core/utils/app_colors.dart';
import 'package:feen_app/core/utils/app_text_styles.dart';
import 'package:feen_app/core/widgets/logo_widget.dart';
import 'package:feen_app/features/auth/presentation/views/login_view.dart';
import 'package:feen_app/features/auth/presentation/views/register_view.dart';
import 'package:feen_app/features/get_started/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});
  static const String routeName = '/get-started';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              Expanded(
                child: LogoWidget(
                  height: 100.h,
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 20.h,
                  children: [
                    CustomButtonWidget(
                      onPressed: () {
                        GoRouter.of(context).push(RegisterView.routeName);
                      },
                      backgroundColor: AppColors.primary,
                      child: Text(
                        AppStrings.newUser,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bold16(context),
                      ),
                    ),
                    CustomButtonWidget(
                      onPressed: () {
                        GoRouter.of(context).push(LoginView.routeName);
                      },
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer,
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                      child: Text(
                        AppStrings.login,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.semiBold16(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
