import 'package:feen_app/core/routes/app_routes.dart';
import 'package:feen_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const FeenApp());
}

class FeenApp extends StatelessWidget {
  const FeenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: AppTheme.getLightTheme(),
        locale: const Locale('ar'),
      ),
    );
  }
}
