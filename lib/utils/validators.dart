import 'package:InstaPredictor/utils/regex.dart';

class Validators {
  bool validateEmail(email) {
    return RegExp(AppRegex.emailPattern).hasMatch(email);
  }

  bool validateNumber(number) {
    return RegExp(AppRegex.mobileNumberPattern).hasMatch(number);
  }
}
