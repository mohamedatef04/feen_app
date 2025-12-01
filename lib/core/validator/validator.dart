class Validator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    final emailRegExp = RegExp(
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
    );

    if (!emailRegExp.hasMatch(value)) {
      return 'البريد الإلكتروني غير صالح';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }

    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'كلمة المرور يجب أن تحتوي على رقم واحد على الأقل';
    }
    if (!value.contains(RegExp(r'^(?=.*?[#?!@$%^&*-])'))) {
      return 'كلمة المرور يجب أن تحتوي على رمز خاص واحد على الأقل';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف مطلوب';
    }
    final phoneRegExp = RegExp(r'^(010|011|012|015)[0-9]{8}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'رقم الهاتف غير صالح';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'تأكيد كلمة المرور مطلوب';
    }
    if (value != password) {
      return 'كلمات المرور غير متطابقة';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'الاسم مطلوب';
    }
    if (value.length < 3) {
      return 'الاسم يجب أن يكون 3 أحرف على الأقل';
    }
    return null;
  }

  static String? validatePersonalId(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم البطاقة الشخصية مطلوب';
    }
    final personalIdRegExp = RegExp(r'^[0-9]{14}$');
    if (!personalIdRegExp.hasMatch(value)) {
      return 'رقم البطاقة الشخصية يجب أن يكون 14 رقم';
    }
    return null;
  }

  static String? validateLicenseNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الرخصة مطلوب';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'رقم الرخصة يجب أن يحتوي على أرقام فقط';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'العنوان مطلوب';
    }
    if (value.length < 5) {
      return 'العنوان يجب أن يكون 5 أحرف على الأقل';
    }
    return null;
  }
}
