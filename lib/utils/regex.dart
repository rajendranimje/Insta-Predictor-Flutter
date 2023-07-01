class AppRegex {
  AppRegex._();
  static const String emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String mobileNumberPattern = r"^([6-9]{1}[0-9]{9})$";
}
