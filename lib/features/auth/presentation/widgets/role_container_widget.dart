import 'package:feen_app/core/utils/app_colors.dart';
import 'package:feen_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleContainerWidget extends StatelessWidget {
  const RoleContainerWidget({
    super.key,
    required this.title,

    required this.isSelected,
    required this.onTap,
    required this.icon,
  });
  final String title;
  final bool isSelected;
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.white : AppColors.primary,
              size: 30.w,
            ),
            Text(
              title,
              style: isSelected
                  ? AppTextStyles.bold16(context)
                  : AppTextStyles.semiBold16(context),
            ),
          ],
        ),
      ),
    );
  }
}
