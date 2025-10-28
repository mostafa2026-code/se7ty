// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/component/main_bottom.dart';
import 'package:se7ty/core/enums/user_type.dart';
import 'package:se7ty/core/functions/reg_exp.dart';
import 'package:se7ty/core/navigation/my_navigation.dart';
import 'package:se7ty/core/navigation/my_routes.dart';

class RegisterScreen extends StatefulWidget {
  final Enum type;
  const RegisterScreen({super.key, required this.type});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
   bool  isObsecure=true;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: LogoImage()),
              Gap(15),
              Text("سجل حساب جديد ك ${widget.type==UserType.Doctor? "طبيب":"مريض" }"),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }else if(MyRegExp.isValidEmail(value)==false){
                    return 'Please enter valid email';
                  } 
                  return null;
                }
,
                decoration: InputDecoration(
                  hintText: "الايميل ",
                  suffix: Icon(Icons.mail),
                ),
              ),
              Gap(10),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }else if(MyRegExp.isValidPassword(value)==false){
                    return 'Please enter valid password';
                  }
                  return null;
                },
                obscureText:isObsecure ,
                decoration: InputDecoration(
                  hintText: "كلمة المرور ",
                  suffix: Icon(isObsecure?Icons.visibility_off: Icons.visibility),
                ),
              ),
              Gap(15),
              MainBottom(title: "تسجيل حساب ", onPressed: () {  },),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("لدي حساب ؟"),
                  TextButton(onPressed: () {
                    pushreplace(context, MyRoutes.login, widget.type);
                  }, child: Text("سجل الدخول")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
