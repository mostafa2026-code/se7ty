import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void register() {
    
    emit(AuthLoading());
    emit(AuthSuccess());
    emit(AuthFailure("error"));
  }
}
