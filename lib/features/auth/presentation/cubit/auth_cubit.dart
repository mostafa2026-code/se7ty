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
  String? imageurl;

  String? selectedStartTime;
  String? selectedendTime;

  final GlobalKey<FormState> logKey = GlobalKey<FormState>();

  final GlobalKey<FormState> regKey = GlobalKey<FormState>();

  void updateDoctordata(DoctorsModel? doctorModel) async {
    try {
      emit(AuthLoading());

      if (doctorModel == null) {
        emit(AuthFailure("No doctor data to update"));
        return;
      }

      final updatedDoctor = doctorModel.copyWith(
        specialization: specialization,
        fromhour: selectedStartTime,
        tohour: selectedendTime,
        about: aboutController.text,
        location: locationController.text,
        phone1: phoneDoctoregController.text,
        phone2: phoneDoctoreg1Controller.text,
        profileImage: imageurl,
      );

      await FireStoreHelper.updateDoctorData(updatedDoctor, updatedDoctor.id!);
      doctorModel = updatedDoctor;

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void register(Enum type) async {
    try {
      if (regKey.currentState!.validate()) {
        emit(AuthLoading());
        UserCredential userCredential = await FireAuthHelper.register(
          emailregController.text,
          passwordRegController.text,
        );

        if (userCredential.user != null) {
          if (type == UserType.Doctor) {
            final DoctorsModel doctorModel = DoctorsModel(
              name: nameRegController.text,
              email: emailregController.text,
              password: passwordRegController.text,
              id: userCredential.user!.uid,
              phone1: phoneDoctoregController.text,
              phone2: phoneDoctoreg1Controller.text,
              specialization: specialization,
              fromhour: selectedStartTime,
              tohour: selectedendTime,
              about: aboutController.text,
              location: locationController.text,
            );
            FireStoreHelper.saveToFirestoreDoctor(
              doctorModel,
              userCredential.user!.uid,
            );
            emit(AuthSuccess());
          } else if (type == UserType.Patient) {
            FireStoreHelper.saveToFirestorePatient(
              PatientModel(
                name: nameRegController.text,
                email: emailregController.text,
                password: passwordRegController.text,
                id: userCredential.user!.uid,
              ),
              userCredential.user!.uid,
            );
            await userCredential.user!.updateDisplayName(
              nameRegController.text,
            );
            emit(AuthSuccess());
          }
        } else
          emit(AuthFailure("An unknown error occurred"));
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
        UserCredential userCredential = await FireAuthHelper.login(
          emaillogController.text,
          passwordLogController.text,
        );
        if (userCredential.user != null)
          if (type == UserType.Doctor) {
            userCredential.user!.updatePhotoURL("doctor");

            emit(AuthSuccess(type: "doctor"));
          } else if (type == UserType.Patient) {
            userCredential.user!.updatePhotoURL("doctor");

            emit(AuthSuccess(type: "patient"));
          } else
            emit(AuthFailure("error"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "An unknown error occurred"));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<String?> uploadImages(String imagePath, String name) async {
    try {
      final String cloudName = "djxelnufi";
      final String presetName = "ml_default";
      Dio dio = Dio();
      var formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imagePath, filename: name),
        'upload_preset': presetName,
      });

      final response = await dio.post(
        "https://api.cloudinary.com/v1_1/$cloudName/image/upload",
        data: formData,
      );
      if (response.statusCode == 200) {
        imageurl = response.data['secure_url'];
        return imageurl;
      }
    } on Exception catch (e) {
      emit(AuthFailure(e.toString()));
    }
    return null;
  }
}
