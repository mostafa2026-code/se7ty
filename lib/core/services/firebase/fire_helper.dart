import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:se7ty/features/auth/data/doctors_model.dart';
import 'package:se7ty/features/auth/data/patient_model.dart';
import 'package:se7ty/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireHelper {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore store = FirebaseFirestore.instance;
  static String kDoctor = "doctors";
  static String kPatient = "patients";
  static final doctorsCollection = store.collection('doctors');
  static final patientsCollection = store.collection('patients');

  static Future init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static saveToFirestoreDoctoe(DoctorsModel model, String uid) async {
    await doctorsCollection.doc(uid).set(model.toMap());
  }

  static saveToFirestorePatient(PatientModel model, String uid) async {
    await patientsCollection.doc(uid).set(model.toMap());
  }
}
