import 'package:feen_app/features/auth/presentation/widgets/logo_with_back_button.dart';
import 'package:feen_app/features/auth/presentation/widgets/driver_and_passenger_toggle_widget.dart';
import 'package:feen_app/features/auth/presentation/widgets/login_driver_text_fields_column_widget.dart';
import 'package:feen_app/features/auth/presentation/widgets/login_passenger_text_fields_column_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const String routeName = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Auto validate mode
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  // Role selection state
  bool _isPassenger = false;

  // Passenger controllers
  final TextEditingController _passengerEmailController =
      TextEditingController();
  final TextEditingController _passengerPasswordController =
      TextEditingController();

  // Driver controllers
  final TextEditingController _driverEmailController = TextEditingController();
  final TextEditingController _driverPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose passenger controllers
    _passengerEmailController.dispose();
    _passengerPasswordController.dispose();

    // Dispose driver controllers
    _driverEmailController.dispose();
    _driverPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Form(
                key: _formKey,
                autovalidateMode: _autoValidateMode,
                child: Column(
                  spacing: 20.h,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const LogoWithBackButton(),
                    DriverAndPassengerToggleWidget(
                      initialIsPassenger: _isPassenger,
                      onRoleChanged: (isPassenger) {
                        setState(() {
                          _isPassenger = isPassenger;
                          // Reset auto-validate mode when switching roles
                          _autoValidateMode = AutovalidateMode.disabled;
                        });
                      },
                    ),
                    // Conditionally show passenger or driver form
                    if (_isPassenger)
                      LoginPassengerTextFieldsColumnWidget(
                        emailController: _passengerEmailController,
                        passwordController: _passengerPasswordController,
                        formKey: _formKey,
                        autoValidateMode: _autoValidateMode,
                        onSubmit: () {
                          // Handle passenger login
                          setState(() {
                            _autoValidateMode =
                                AutovalidateMode.onUserInteraction;
                          });
                        },
                      )
                    else
                      LoginDriverTextFieldsColumnWidget(
                        emailController: _driverEmailController,
                        passwordController: _driverPasswordController,
                        formKey: _formKey,
                        autoValidateMode: _autoValidateMode,
                        onSubmit: () {
                          // Handle driver login
                          setState(() {
                            _autoValidateMode =
                                AutovalidateMode.onUserInteraction;
                          });
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
