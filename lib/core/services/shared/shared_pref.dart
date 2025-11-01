import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _preferences;

  static const String _kIsONboardingSeen = "is_onboarding_seen";

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setOnboardingSeen() async {
    await _preferences?.setBool(_kIsONboardingSeen, true);
  }

  static bool isOnboardingSeen() {
    return _preferences?.getBool(_kIsONboardingSeen) ?? false;
  }


  static const isPatientKey = "is_patient";

  static Future setUserType() async {
    await _preferences?.setBool(isPatientKey, true);
  }
  static bool isPatient() {
    return _preferences?.getBool(isPatientKey) ?? true;
  }



  
}
