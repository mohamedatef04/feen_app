import 'package:feen_app/core/constants/app_strings.dart';
import 'package:feen_app/core/utils/app_colors.dart';
import 'package:feen_app/core/utils/app_text_styles.dart';
import 'package:feen_app/core/validator/validator.dart';
import 'package:feen_app/features/auth/presentation/views/success_registration_view.dart';
import 'package:feen_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:feen_app/features/get_started/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterPassengerTextFieldsColumnWidget extends StatelessWidget {
  const RegisterPassengerTextFieldsColumnWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
    required this.autoValidateMode,
    this.onSubmit,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Passenger Name Field
        _buildFieldWithHeader(
          context: context,
          headerText: AppStrings.fullName,
          hintText: 'أدخل ${AppStrings.fullName}',
          icon: Icons.person_outline,
          controller: nameController,
          keyboardType: TextInputType.name,
          validator: Validator.validateName,
        ),

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

        // Phone Field
        _buildFieldWithHeader(
          context: context,
          headerText: AppStrings.phoneNumber,
          hintText: 'أدخل ${AppStrings.phoneNumber}',
          icon: Icons.phone_outlined,
          controller: phoneController,
          keyboardType: TextInputType.phone,
          validator: Validator.validatePhone,
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

        // Confirm Password Field
        _buildFieldWithHeader(
          context: context,
          headerText: 'تأكيد كلمة المرور',
          hintText: 'أعد إدخال كلمة المرور',
          icon: Icons.lock_outline,
          controller: confirmPasswordController,
          obscureText: true,
          validator: (value) => Validator.validateConfirmPassword(
            value,
            passwordController.text,
          ),
        ),

        // Submit Button
        CustomButtonWidget(
          backgroundColor: AppColors.primary,
          onPressed: () {
            GoRouter.of(
              context,
            ).push(SuccessRegistrationView.routeName);
            if (formKey.currentState!.validate()) {
              // Form is valid, call onSubmit callback
              onSubmit?.call();
            }
          },
          child: Text(
            AppStrings.send,
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
