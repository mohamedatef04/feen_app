import 'package:feen_app/features/auth/presentation/widgets/logo_with_back_button.dart';
import 'package:feen_app/features/auth/presentation/widgets/driver_and_passenger_toggle_widget.dart';
import 'package:feen_app/features/auth/presentation/widgets/register_driver_text_fields_column_widget.dart';
import 'package:feen_app/features/auth/presentation/widgets/register_passenger_text_fields_column_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static const String routeName = '/register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Auto validate mode
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  // Role selection state
  bool _isPassenger = false;

  // Passenger controllers
  final TextEditingController _passengerNameController =
      TextEditingController();
  final TextEditingController _passengerEmailController =
      TextEditingController();
  final TextEditingController _passengerPhoneController =
      TextEditingController();
  final TextEditingController _passengerPasswordController =
      TextEditingController();
  final TextEditingController _passengerConfirmPasswordController =
      TextEditingController();

  // Driver controllers
  final TextEditingController _driverNameController = TextEditingController();
  final TextEditingController _driverEmailController = TextEditingController();
  final TextEditingController _driverPersonalIdController =
      TextEditingController();
  final TextEditingController _driverLicenseNumberController =
      TextEditingController();
  final TextEditingController _driverPhoneController = TextEditingController();
  final TextEditingController _driverAddressController =
      TextEditingController();
  final TextEditingController _driverPasswordController =
      TextEditingController();
  final TextEditingController _driverConfirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose passenger controllers
    _passengerNameController.dispose();
    _passengerEmailController.dispose();
    _passengerPhoneController.dispose();
    _passengerPasswordController.dispose();
    _passengerConfirmPasswordController.dispose();

    // Dispose driver controllers
    _driverNameController.dispose();
    _driverEmailController.dispose();
    _driverPersonalIdController.dispose();
    _driverLicenseNumberController.dispose();
    _driverPhoneController.dispose();
    _driverAddressController.dispose();
    _driverPasswordController.dispose();
    _driverConfirmPasswordController.dispose();

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
                      RegisterPassengerTextFieldsColumnWidget(
                        nameController: _passengerNameController,
                        emailController: _passengerEmailController,
                        phoneController: _passengerPhoneController,
                        passwordController: _passengerPasswordController,
                        confirmPasswordController:
                            _passengerConfirmPasswordController,
                        formKey: _formKey,
                        autoValidateMode: _autoValidateMode,
                        onSubmit: () {
                          // Handle passenger registration
                          setState(() {
                            _autoValidateMode =
                                AutovalidateMode.onUserInteraction;
                          });
                        },
                      )
                    else
                      RegisterDriverTextFieldsColumnWidget(
                        nameController: _driverNameController,
                        emailController: _driverEmailController,
                        personalIdController: _driverPersonalIdController,
                        licenseNumberController: _driverLicenseNumberController,
                        phoneController: _driverPhoneController,
                        addressController: _driverAddressController,
                        passwordController: _driverPasswordController,
                        confirmPasswordController:
                            _driverConfirmPasswordController,
                        formKey: _formKey,
                        autoValidateMode: _autoValidateMode,
                        onSubmit: () {
                          // Handle driver registration
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
