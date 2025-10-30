// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/component/main_bottom.dart';
import 'package:se7ty/core/enums/user_type.dart';
import 'package:se7ty/core/functions/reg_exp.dart';
import 'package:se7ty/core/navigation/my_navigation.dart';
import 'package:se7ty/core/navigation/my_routes.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_states.dart';

class RegisterScreen extends StatefulWidget {
  final Enum type;
  const RegisterScreen({super.key, required this.type});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late AuthCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    bool isObsecure = true;
    return BlocListener<AuthCubit, AuthStates>(
      bloc: BlocProvider.of<AuthCubit>(context),
      listener: (context, state) {
        if (state is AuthSuccess) {
          pop(context);
          if (widget.type == UserType.Doctor) {
            pushreplace(context, MyRoutes.completedoctor, null);
          } else {
            pushreplace(context, MyRoutes.home, null);
          }
        } else if (state is AuthFailure) {
          pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => Center(child: CircularProgressIndicator()),
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Form(
              key: cubit.regKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: LogoImage()),
                  Gap(15),
                  Text(
                    "سجل حساب جديد ك ${widget.type == UserType.Doctor ? "طبيب" : "مريض"}",
                  ),
                  TextFormField(
                    controller: cubit.nameRegController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء ادخال الاسم ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "الاسم ",
                      suffix: Icon(Icons.person),
                    ),
                  ),
                  Gap(10),
                  TextFormField(
                    controller: cubit.emailregController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء ادخال الايميل ';
                      } else if (MyRegExp.isValidEmail(value) == false) {
                        return 'الرجاء ادخال ايميل صحيح ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "الايميل ",
                      suffix: Icon(Icons.mail),
                    ),
                  ),
                  Gap(10),
                  TextFormField(
                    controller: cubit.passwordRegController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء ادخال كلمة المرور ';
                      } else if (value.length < 6) {
                        return 'كلمة المرور يجب ان تكون اكثر من 6 احرف ';
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: isObsecure,
                    decoration: InputDecoration(
                      hintText: "كلمة المرور ",
                      suffix: Icon(
                        isObsecure ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  Gap(15),
                  MainBottom(
                    title: "تسجيل حساب ",
                    onPressed: () {
                      cubit.register(widget.type);
                    },
                  ),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("لدي حساب ؟"),
                      TextButton(
                        onPressed: () {
                          pushreplace(context, MyRoutes.login, widget.type);
                        },
                        child: Text("سجل الدخول"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
