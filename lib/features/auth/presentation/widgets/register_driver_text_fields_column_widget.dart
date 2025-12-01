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

class RegisterDriverTextFieldsColumnWidget extends StatelessWidget {
  const RegisterDriverTextFieldsColumnWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.personalIdController,
    required this.licenseNumberController,
    required this.phoneController,
    required this.addressController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
    required this.autoValidateMode,
    this.onSubmit,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController personalIdController;
  final TextEditingController licenseNumberController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
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
        // Driver Name Field
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

        // Personal ID + License Number Row
        Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: _buildFieldWithHeader(
                context: context,
                headerText: AppStrings.personalIdCard,
                hintText: 'رقم البطاقة',
                icon: Icons.badge_outlined,
                controller: personalIdController,
                keyboardType: TextInputType.number,
                validator: Validator.validatePersonalId,
              ),
            ),
            Expanded(
              child: _buildFieldWithHeader(
                context: context,
                headerText: AppStrings.licenseImage,
                hintText: 'رقم الرخصة',
                icon: Icons.credit_card_outlined,
                controller: licenseNumberController,
                keyboardType: TextInputType.number,
                validator: Validator.validateLicenseNumber,
              ),
            ),
          ],
        ),

        // Phone + Address Row
        Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: _buildFieldWithHeader(
                context: context,
                headerText: AppStrings.phoneNumber,
                hintText: 'رقم الهاتف',
                icon: Icons.phone_outlined,
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: Validator.validatePhone,
              ),
            ),
            Expanded(
              child: _buildFieldWithHeader(
                context: context,
                headerText: 'العنوان',
                hintText: 'العنوان',
                icon: Icons.location_on_outlined,
                controller: addressController,
                keyboardType: TextInputType.streetAddress,
                validator: Validator.validateAddress,
              ),
            ),
          ],
        ),

        // Password + Confirm Password Row
        Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: _buildFieldWithHeader(
                context: context,
                headerText: 'كلمة المرور',
                hintText: 'كلمة المرور',
                icon: Icons.lock_outline,
                controller: passwordController,
                obscureText: true,
                validator: Validator.validatePassword,
              ),
            ),
            Expanded(
              child: _buildFieldWithHeader(
                context: context,
                headerText: 'تأكيد كلمة المرور',
                hintText: 'تأكيد كلمة المرور',
                icon: Icons.lock_outline,
                controller: confirmPasswordController,
                obscureText: true,
                validator: (value) => Validator.validateConfirmPassword(
                  value,
                  passwordController.text,
                ),
              ),
            ),
          ],
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
        Text(
          headerText,
          style: AppTextStyles.bold14(context),
        ),
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
