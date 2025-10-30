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

class LoginScreen extends StatefulWidget {
  final Enum type;
  const LoginScreen({super.key, required this.type});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthCubit cubit;
  @override
  void initState() {
    super.initState();

    cubit = context.read<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    bool isSecured = true;
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) => {
        if (state is AuthSuccess)
          {pop(context), pushreplace(context, MyRoutes.home, null)}
        else if (state is AuthFailure)
          {
            pop(context),
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error))),
          }
        else if (state is AuthLoading)
          {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => Center(child: CircularProgressIndicator()),
            ),
          },
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Form(
                key: cubit.logKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LogoImage(),
                    Gap(15),
                    Text(
                      "سجل الدخول ك ${widget.type == UserType.Doctor ? "طبيب" : "مريض"} ",
                    ),
                    Gap(15),

                    Gap(10),
                    TextFormField(
                      controller: cubit.emaillogController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        } else if (!MyRegExp.emailRegExp.hasMatch(value)) {
                          return 'Please enter a valid email';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "الايميل ",
                        suffix: Icon(Icons.mail),
                      ),
                    ),
                    Gap(10),
                    TextFormField(
                      maxLines: 1,
                      controller: cubit.passwordLogController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else {
                          return null;
                        }
                      },
                      obscureText: isSecured,

                      decoration: InputDecoration(
                        hintText: "كلمة المرور ",
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isSecured = !isSecured;
                            });
                          },
                          icon: Icon(
                            // ignore: dead_code
                            isSecured ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    Gap(15),
                    MainBottom(
                      title: "  تشجيل الدخول  ",
                      onPressed: () {
                        cubit.login(widget.type);
                      },
                    ),
                    Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ليس لدي حساب ؟"),
                        TextButton(
                          onPressed: () {
                            pushreplace(
                              context,
                              MyRoutes.register,
                              widget.type,
                            );
                          },
                          child: Text(" سجل الان "),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
