
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/services/firebase/fire_helper.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  final TextEditingController emaillogController = TextEditingController();
  final TextEditingController passwordLogController = TextEditingController();
  final TextEditingController emailregController = TextEditingController();
  final TextEditingController passwordRegController = TextEditingController();
  final TextEditingController nameRegController = TextEditingController();

  final GlobalKey<FormState> logKey = GlobalKey<FormState>();

  final GlobalKey<FormState> regKey = GlobalKey<FormState>();

  void register() async {
    try {
      if (!regKey.currentState!.validate()) {
        emit(AuthLoading());
        UserCredential userCredential = await FireHelper.auth
            .createUserWithEmailAndPassword(
              email: emailregController.text.trim(),
              password: passwordRegController.text.trim(),
            );
        if (userCredential.user != null)
          emit(AuthSuccess());
        else
          emit(AuthFailure("error"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "An unknown error occurred"));
    } catch (e) {
      emit(AuthFailure("An unknown error occurred"));
    }
  }

  void login() async {
    try {
      if (logKey.currentState!.validate()) {
        emit(AuthLoading());
        UserCredential userCredential = await FireHelper.auth
            .signInWithEmailAndPassword(
              email: emaillogController.text.trim(),
              password: passwordLogController.text.trim(),
            );
        if (userCredential.user != null)
          emit(AuthSuccess());
        else
          emit(AuthFailure("error"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "An unknown error occurred"));
    } catch (e) {
      emit(AuthFailure("An unknown error occurred"));
    }
  }
}
