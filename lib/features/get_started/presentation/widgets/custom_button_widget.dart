import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderSide = BorderSide.none,
  });
  final Widget child;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderSide borderSide;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: 150.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor:
              backgroundColor, // Apply background color even when disabled
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            side: borderSide,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
