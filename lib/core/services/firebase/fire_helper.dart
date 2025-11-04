import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se7ty/features/auth/data/doctors_model.dart';
import 'package:se7ty/features/auth/data/patient_model.dart';

class FireAuthHelper {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static Future<UserCredential> login(String email, String password) async {
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<UserCredential> register(String email, String password) async {
    return await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static logout() {
    auth.signOut();
  }

  static Future<String?> getUsername() async {
    return auth.currentUser!.displayName.toString();
  }
}

class FireStoreHelper {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final String doctorKey = "doctors";
  static final String patientKey = "patients";

  static saveToFirestoreDoctor(DoctorsModel doctorModel, String id) async {
    await firestore.collection(doctorKey).doc(id).set(doctorModel.toMap());
  }

  static saveToFirestorePatient(PatientModel patientModel, String id) async {
    await firestore.collection(patientKey).doc(id).set(patientModel.toMap());
  }

  static updateDoctorData(DoctorsModel doctorModel, String id) async {
    await firestore
        .collection(doctorKey)
        .doc(doctorModel.id)
        .update(doctorModel.toMap());
  }

  static getDoctorofSpecialization(String specialization) async {
    return await firestore
        .collection(doctorKey)
        .where('specialization', isEqualTo: specialization)
        .get();
  }

  static getDoctorsbyrating(int rating) async {
    return await firestore
        .collection(doctorKey)
        .where('rating', isEqualTo: rating)
        .get();
  }

  static Future<DoctorsModel?> getDoctorData(String uid) async {
    final doc = await FirebaseFirestore.instance
        .collection('doctors')
        .doc(uid)
        .get();
    if (doc.exists) {
      return DoctorsModel.fromJson(doc.data()!);
    }
    return null;
  }

  Future<void> loadDoctorData(DoctorsModel? doctorModel) async {
    doctorModel = await FireStoreHelper.getDoctorData(
      FireAuthHelper.auth.currentUser!.uid,
    );
  }

  
}
