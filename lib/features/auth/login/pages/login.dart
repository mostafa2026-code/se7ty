import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/component/main_bottom.dart';

class LoginScreen extends StatelessWidget {
  final String type;
  const LoginScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50, child: LogoSVg()),
              Gap(15),
              Text("سجل الدخول ك $type "),
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
                  Text("ليس لدي حساب ؟"),
                  TextButton(onPressed: () {}, child: Text(" سجل الان ")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
