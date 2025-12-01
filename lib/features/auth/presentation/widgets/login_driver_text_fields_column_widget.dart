import 'package:feen_app/core/constants/app_strings.dart';
import 'package:feen_app/core/utils/app_colors.dart';
import 'package:feen_app/core/utils/app_text_styles.dart';
import 'package:feen_app/core/validator/validator.dart';
import 'package:feen_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:feen_app/features/get_started/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginDriverTextFieldsColumnWidget extends StatelessWidget {
  const LoginDriverTextFieldsColumnWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.autoValidateMode,
    this.onSubmit,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Email Field
        _buildFieldWithHeader(
          context: context,
          headerText: AppStrings.email,
          hintText: 'أدخل ${AppStrings.email}',
          icon: Icons.email_outlined,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          validator: Validator.validateEmail,
        ),

        // Password Field
        _buildFieldWithHeader(
          context: context,
          headerText: 'كلمة المرور',
          hintText: 'أدخل كلمة المرور',
          icon: Icons.lock_outline,
          controller: passwordController,
          obscureText: true,
          validator: Validator.validatePassword,
        ),

        // Submit Button
        CustomButtonWidget(
          backgroundColor: AppColors.primary,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // Form is valid, call onSubmit callback
              onSubmit?.call();
            }
          },
          child: Text(
            AppStrings.login,
            style: AppTextStyles.bold16(context),
          ),
        ),
      ],
    );
  }

  Widget _buildFieldWithHeader({
    required BuildContext context,
    required String headerText,
    required String hintText,
    required IconData icon,
    TextEditingController? controller,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(headerText, style: AppTextStyles.bold14(context)),
        CustomTextFormField(
          hintText: hintText,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          prefixIcon: Icon(
            icon,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
