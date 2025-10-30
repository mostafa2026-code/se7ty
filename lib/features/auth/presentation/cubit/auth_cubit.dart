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
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();

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
            FireHelper.saveToFirestoreDoctoe(
              DoctorsModel(
                name: nameRegController.text,
                email: emaillogController.text,
                password: passwordLogController.text,
                id: userCredential.user!.uid,
                
              ),
              userCredential.user!.uid,
            );
            emit(AuthSuccess());
          } else if (type == UserType.Patient) {
            FireHelper.saveToFirestorePatient(
              PatientModel(
                name: nameRegController.text,
                email: emaillogController.text,
                password: passwordLogController.text,
                id: userCredential.user!.uid,
              ),
              userCredential.user!.uid,
            );
            emit(AuthSuccess());
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
}
