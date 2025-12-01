import 'package:feen_app/features/auth/presentation/views/login_view.dart';
import 'package:feen_app/features/auth/presentation/views/success_registration_view.dart';
import 'package:feen_app/features/auth/presentation/views/register_view.dart';
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
    GoRoute(
      path: RegisterView.routeName,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: LoginView.routeName,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: SuccessRegistrationView.routeName,
      builder: (context, state) => const SuccessRegistrationView(),
    ),
  ],
);
