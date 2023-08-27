class Validator {
  static String? validateEmail(String email) {
    RegExp regExp = RegExp(r'[@.]');
    if (email.isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(email)) {
      return 'Incorrect email format';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    } else if (password.length <= 8) {
      return 'Password can\'t be less than 9 characters';
    }
    return null;
  }
}
