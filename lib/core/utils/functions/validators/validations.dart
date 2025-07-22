import 'app_regex.dart';

abstract class Validations {
  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return '⚠️ Name is required and cannot be empty.';
    } else if (!AppRegExp.isNameValid(name)) {
      return '⚠️ Invalid name! Only letters are allowed.';
    }
    return null;
  }

  static String? validateStudentId(String? id) {
    if (id == null || id.trim().isEmpty) {
      return '⚠️ Student ID is required and cannot be empty.';
    } else if (!AppRegExp.isNationalIDValid(id)) {
      return '⚠️ Invalid Student ID! It must contain exactly 6 digits.';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return '⚠️ Email is required and cannot be empty.';
    } else if (!AppRegExp.isEmailValid(email)) {
      return '⚠️ Invalid email format! Use: example@domain.com';
    }
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return '⚠️ Phone number is required and cannot be empty.';
    } else if (!AppRegExp.isPhoneNumberValid(phoneNumber)) {
      return '⚠️ Invalid phone number! It must contain exactly 10 digits.';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return '⚠️ Password is required and cannot be empty.';
    } else if (!AppRegExp.isPasswordValid(password)) {
      return '⚠️ Weak password! It must be at least 8 characters long and include an uppercase letter and a number.';
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return '⚠️ Confirm Password is required and cannot be empty.';
    } else if (password != confirmPassword) {
      return '⚠️ Password and Confirm Password do not match.';
    }
    return null;
  }

  static String ? validateTextIsEmpty(String? text) {
    if (text == null || text.trim().isEmpty) {
      return '⚠️ Text is required and cannot be empty.';
    }
    return null;
  }
  static String? validateTextIsOnlyNumbers(String? text) {
    if (text == null || text.trim().isEmpty) {
      return '⚠️ Number is required and cannot be empty.';
    }

    final RegExp numbersOnly = RegExp(r'^\d+$');

    if (!numbersOnly.hasMatch(text)) {
      return '⚠️ Only numbers are allowed.';
    }

    return null;
  }
}
