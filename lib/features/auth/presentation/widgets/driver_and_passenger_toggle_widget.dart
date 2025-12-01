import 'package:feen_app/core/constants/app_strings.dart';
import 'package:feen_app/core/utils/app_colors.dart';
import 'package:feen_app/features/auth/presentation/widgets/role_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class DriverAndPassengerToggleWidget extends StatefulWidget {
  const DriverAndPassengerToggleWidget({
    super.key,
    required this.onRoleChanged,
    this.initialIsPassenger = false,
  });

  final Function(bool isPassenger) onRoleChanged;
  final bool initialIsPassenger;

  @override
  State<DriverAndPassengerToggleWidget> createState() =>
      _DriverAndPassengerToggleWidgetState();
}

class _DriverAndPassengerToggleWidgetState
    extends State<DriverAndPassengerToggleWidget> {
  late bool isPassenger;

  @override
  void initState() {
    super.initState();
    isPassenger = widget.initialIsPassenger;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 60.h,
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.primary,
          width: 2.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          children: [
            Expanded(
              child: RoleContainerWidget(
                icon: Iconsax.car,
                title: AppStrings.driver,
                isSelected: !isPassenger,
                onTap: () {
                  setState(() {
                    isPassenger = false;
                    widget.onRoleChanged(isPassenger);
                  });
                },
              ),
            ),
            Expanded(
              child: RoleContainerWidget(
                icon: Iconsax.user,
                title: AppStrings.passenger,
                isSelected: isPassenger,
                onTap: () {
                  setState(() {
                    isPassenger = true;
                    widget.onRoleChanged(isPassenger);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
