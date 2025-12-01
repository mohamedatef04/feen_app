import 'package:feen_app/core/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWithBackButton extends StatelessWidget {
  const LogoWithBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Expanded(
          child: LogoWidget(
            height: 50.h,
          ),
        ),
        SizedBox(width: 48.w), // Balance the back button
      ],
    );
  }
}
