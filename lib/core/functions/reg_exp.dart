class MyRegExp {
  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
 static  bool isValidEmail(String email) {
    return emailRegExp.hasMatch(email);
  }

static final RegExp passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static bool isValidPassword(String password) {
    return passwordRegExp.hasMatch(password);
  }


  static final RegExp phoneRegExp = RegExp(
    r'^\+?[0-9]{7,15}$',
  );

  static bool isValidPhone(String phone) {
    return phoneRegExp.hasMatch(phone);
  }
}