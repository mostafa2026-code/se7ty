import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/component/main_bottom.dart';

import 'package:se7ty/features/auth/login/pages/login.dart';

class RegisterScreenDoc extends StatelessWidget {
  final String type;
  const RegisterScreenDoc({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50, child: LogoSVg()),
              Gap(15),
              Text("سجل حساب جديد ك ${type} "),
              TextFormField(
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
                decoration: InputDecoration(
                  hintText: "كلمة المرور ",
                  suffix: Icon(Icons.visibility_off),
                ),
              ),
              Gap(15),
              MainBottom(title: "تسجيل حساب "),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("لدي حساب ؟"),
                  TextButton(onPressed: () {}, child: Text("سجل الدخول")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
