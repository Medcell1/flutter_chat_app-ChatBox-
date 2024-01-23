class Validation {
  static String? validateName(String? value) {
    if (value!.isEmpty || value == null) return 'This Field is Required';
    return null;
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) return 'Email is Required';
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) return 'Please Input a Valid email';
    return null;
  }
  static String? validateFirstPassword(String? value) {
    if(value!.isEmpty || value.length<6) return 'This Field is Required';
    return null;
  }
  static String? validateSecondPassword(String? value , String firstPassword) {
    if(value!.isEmpty || value != firstPassword) {
      return 'Password does not match';
    }
  }
}
