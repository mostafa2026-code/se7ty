import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/component/main_bottom.dart';
import 'package:se7ty/core/enums/user_type.dart';
import 'package:se7ty/core/functions/reg_exp.dart';

class LoginScreen extends StatefulWidget {
  final Enum type;
  const LoginScreen({super.key, required this.type});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    bool isSecured = true;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (MyRegExp.isValidEmail(value) == false) {
                      return 'Please enter valid email';
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
                  decoration: InputDecoration(
                    hintText: "الايميل ",
                    suffix: Icon(Icons.mail),
                  ),
                ),
                Gap(10),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    } else if (MyRegExp.isValidPassword(value) == false) {
                      return 'Please enter valid Password ';
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
                MainBottom(title: "تسجيل حساب ", onPressed: () {}),
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ليس لدي حساب ؟"),
                    TextButton(onPressed: () {}, child: Text(" سجل الان ")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
