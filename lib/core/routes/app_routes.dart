import 'package:feen_app/features/get_started/presentation/views/get_started_view.dart';
import 'package:feen_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: GetStartedView.routeName,
      builder: (context, state) => const GetStartedView(),
    ),
  ],
);
