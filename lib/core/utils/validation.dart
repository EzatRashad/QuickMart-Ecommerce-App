class Validation {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    } else if (value.length < 8) {
      return 'Name must be at least 8 characters long';
    }
    return null;
  }

  static String? validateEmail(String value) {
    final RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    // Password should contain at least one uppercase letter, one number, and be at least 8 characters long
    final RegExp passwordRegExp =
        RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-zA-Z]).{8,}$');

    if (value.isEmpty) {
      return 'Password cannot be empty';
    } else if (!passwordRegExp.hasMatch(value)) {
      return 'Password must be at least 8 characters long and contain at least one uppercase letter and one number';
    }
    return null;
  }

  static String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password cannot be empty';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (value.length < 11) {
      return 'Name must be at least 11 characters long';
    }
    return null;
  }
}