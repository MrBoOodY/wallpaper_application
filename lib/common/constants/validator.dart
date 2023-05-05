// 🐦 Flutter imports:
import 'package:flutter/services.dart';

enum ValidationType { name, notEmpty, email, validationCode }

class AppValidator {
  static FilteringTextInputFormatter priceValueOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
  }

  static validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern.toString());
    if (value.isEmpty) {
      return 'please enter pass';
    } else if (!regex.hasMatch(value)) {
      return 'enter valid password';
    }
    return null;
  }

  static validateConfirmPassword(String value, String confirm) {
    if (value.isEmpty) {
      return 'please enter pass';
    } else if (value != confirm) {
      return 'passwords do not match';
    }
    return null;
  }

  static validatePhone(String? phone, String? numbersCount) {
    if (phone == null || phone.isEmpty) {
      return 'please fill this field';
    } else if (phone.length != int.parse(numbersCount ?? '11')) {
      return 'enter valid phone';
    }
    return null;
  }

  static String? validateFields(
    String? value,
    ValidationType fieldType,
  ) {
    value = value ?? '';
    if ((fieldType == ValidationType.notEmpty && value.trim().isEmpty) ||
        value.trim().isEmpty) {
      return 'please fill this field';
    } else if (fieldType == ValidationType.name) {
      if (!RegExp(r'^[a-zA-zأ-ي\s]+$').hasMatch(value)) {
        return 'enter valid name';
      }
    } else if (fieldType == ValidationType.email) {
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        return 'enter valid email';
      }
    }
    return null;
  }
}
