import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/enums/user_type.dart';
import 'package:se7ty/core/services/firebase/fire_helper.dart';
import 'package:se7ty/features/auth/data/doctors_model.dart';
import 'package:se7ty/features/auth/data/patient_model.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  final TextEditingController emaillogController = TextEditingController();
  final TextEditingController passwordLogController = TextEditingController();
  final TextEditingController emailregController = TextEditingController();
  final TextEditingController passwordRegController = TextEditingController();
  final TextEditingController nameRegController = TextEditingController();
  final TextEditingController phoneDoctoregController = TextEditingController();
  final TextEditingController phoneDoctoreg1Controller =
      TextEditingController();
  String? specialization;
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController feesController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  String? selectedStartTime;
  String? selectedendTime;

  final GlobalKey<FormState> logKey = GlobalKey<FormState>();

  final GlobalKey<FormState> regKey = GlobalKey<FormState>();

  void register(Enum type) async {
    try {
      if (regKey.currentState!.validate()) {
        emit(AuthLoading());
        UserCredential userCredential = await FireHelper.auth
            .createUserWithEmailAndPassword(
              email: emailregController.text.trim(),
              password: passwordRegController.text.trim(),
            );
        if (userCredential.user != null) {
          emit(AuthSuccess());
          if (type == UserType.Doctor) {
            FireHelper.saveToFirestoreDoctoe(
              DoctorsModel(
                name: nameRegController.text,
                email: emailregController.text,
                password: passwordRegController.text,
                id: userCredential.user!.uid,
                about: '',
                location: '',
                fromhour: '',
                tohour: '',
              ),
              userCredential.user!.uid,
            );
            emit(AuthSuccess());
          } else if (type == UserType.Patient) {
            FireHelper.saveToFirestorePatient(
              PatientModel(
                name: nameRegController.text,
                email: emailregController.text,
                password: '',
                id: userCredential.user!.uid,
              ),
              userCredential.user!.uid,
            );
            emit(AuthSuccess());
          }
        } else
          emit(AuthFailure("error"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "An unknown error occurred"));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void login(Enum type) async {
    try {
      if (logKey.currentState!.validate()) {
        emit(AuthLoading());
        UserCredential userCredential = await FireHelper.auth
            .signInWithEmailAndPassword(
              email: emaillogController.text.trim(),
              password: passwordLogController.text.trim(),
            );
        if (userCredential.user != null)
          if (type == UserType.Doctor) {
            userCredential.user!.updatePhotoURL("doctor");
            FireHelper.saveToFirestoreDoctoe(
              DoctorsModel(
                name: nameRegController.text,
                email: emaillogController.text,
                password: passwordLogController.text,
                id: userCredential.user!.uid,
                about: '',
                location: '',
                fromhour: '',
                tohour: '',
              ),
              userCredential.user!.uid,
            );
            emit(AuthSuccess(type: "doctor"));
          } else if (type == UserType.Patient) {
            userCredential.user!.updatePhotoURL("doctor");
            FireHelper.saveToFirestorePatient(
              PatientModel(
                name: nameRegController.text,
                email: emaillogController.text,
                password: passwordLogController.text,
                id: userCredential.user!.uid,
              ),
              userCredential.user!.uid,
            );
            emit(AuthSuccess(type: "patient"));
            // SharedPref().setPatient(
            //   PatientModel(
            //     name: nameRegController.text,
            //     email: emaillogController.text,
            //     password: passwordLogController.text,
            //     id: userCredential.user!.uid,
            //   ),
            // );
          } else
            emit(AuthFailure("error"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "An unknown error occurred"));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> uploadImages(String imagePath, String name) async {
    try {
      Dio dio = Dio();
      var formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imagePath, filename: name),
      });
      dio.post(
        "CLOUDINARY_URL=cloudinary://<your_api_key>:<your_api_secret>@djxelnufi",
        data: formData,
      );
    } on Exception catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> updateDoctorData(String uid) async {
    try {
      emit(AuthLoading());
      FireHelper.updateFirestoreDoctoe(
        DoctorsModel(
          name: nameRegController.text,
          email: emailregController.text,
          password: passwordRegController.text,
          id: uid,
          specialization: specialization ?? '',
          degree: degreeController.text,
          hospital: hospitalController.text,
          location: locationController.text,
          fees: feesController.text,
          certification: [],
          about: aboutController.text,
          phone: phoneDoctoregController.text,
          age: '',
          gender: '',
          address: '',
          profileImage: '',
          fromhour: selectedStartTime,
          tohour: selectedendTime,
        ),
        uid,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
