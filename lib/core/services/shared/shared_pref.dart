// import 'dart:convert';

// import 'package:se7ty/features/auth/data/doctors_model.dart';
// import 'package:se7ty/features/auth/data/patient_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPref {
//   static const String token = 'token';
//   late SharedPreferences sharedPref;

//   void init() {
//     sharedPref = SharedPreferences.getInstance() as SharedPreferences;
//   }

//   void setDoctor(DoctorsModel model) async {
//     Map<String, dynamic> doctorMap = model.toMap();
//     String doctorString = jsonEncode(doctorMap);
//     await ('doctor', doctorString);
//   }

//   void setPatient(PatientModel model) async {
//     Map<String, dynamic> doctorMap = model.toMap();
//     String doctorString = jsonEncode(doctorMap);
//     await ('doctor', doctorString);
//   }

//   DoctorsModel? getDoctor() {
//     String? doctorString = sharedPref.getString('doctor');
//     if (doctorString != null) {
//       Map<String, dynamic> doctorMap = jsonDecode(doctorString);
//       return DoctorsModel.fromMap(doctorMap);
//     }
//     return null;
//   }

//   PatientModel? getPatient() {
//     getString('doctor');
//     if (doctorString != null) {
//       Map<String, dynamic> doctorMap = jsonDecode(doctorString);
//       return PatientModel.fromMap(doctorMap);
//     }
//     return null;
//   }
// }
