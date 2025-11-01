import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/component/main_bottom.dart';
import 'package:se7ty/core/enums/user_type.dart';
import 'package:se7ty/core/navigation/my_navigation.dart';
import 'package:se7ty/core/navigation/my_routes.dart';
import 'package:se7ty/core/services/firebase/fire_helper.dart';
import 'package:se7ty/core/utils/my_colors.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:se7ty/core/utils/my_image.dart';
import 'package:se7ty/core/utils/my_styles.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_states.dart';

class DoctorRegisterComplete extends StatefulWidget {
  const DoctorRegisterComplete({super.key});

  @override
  State<DoctorRegisterComplete> createState() => _DoctorRegisterCompleteState();
}

class _DoctorRegisterCompleteState extends State<DoctorRegisterComplete> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ImagePicker picker = ImagePicker();
    String? imagePath;
    final authCubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) => {
        if (state is AuthLoading)
          {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(color: MyColors.primary),
              ),
            ),
          }
        else if (state is AuthSuccess)
          {goBase(context, MyRoutes.mainDoctor, null)}
        else if (state is AuthFailure)
          {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error))),
          },
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('اكمال عملية التسجيل'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                "اختر صورة الملف الشخصي",
                                style: MyStyles.n16primary(),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.camera_alt),
                                    title: Text("الكاميرا"),
                                    onTap: () async {
                                      final XFile? photo = await picker
                                          .pickImage(
                                            source: ImageSource.camera,
                                          );
                                      if (photo != null) {
                                        setState(() {
                                          imagePath = photo.path;
                                        });

                                        // authCubit.uploadImages(
                                        //   imagePath ?? "",
                                        //   FireHelper
                                        //           .auth
                                        //           .currentUser!
                                        //           .displayName ??
                                        //       "unKown User",
                                        // );
                                      }
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo_library),
                                    title: Text("معرض الصور"),
                                    onTap: () async {
                                      final XFile? image = await picker
                                          .pickImage(
                                            source: ImageSource.gallery,
                                          );
                                      if (image != null) {
                                        setState(() {
                                          imagePath = image.path;
                                        });
                                        imagePath = image.path;
                                        // authCubit.uploadImages(
                                        //   imagePath ?? "",
                                        //   FireHelper
                                        //           .auth
                                        //           .currentUser!
                                        //           .displayName ??
                                        //       "unKown User",
                                        // );
                                      }
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 80,
                              backgroundImage: AssetImage(MyImage.doc),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Icon(Icons.camera_alt),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(15),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffe6eef8),
                    ),
                    child: DropdownButton(
                      alignment: Alignment.centerRight,
                      isExpanded: true,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      icon: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: MyColors.primary,
                      ),
                      underline: SizedBox(),
                      menuWidth: MediaQuery.of(context).size.width,
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      value: authCubit.specialization,
                      hint: Text(authCubit.specialization ?? "اختر التخصص"),
                      items: [
                        ...specializations
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                      ],
                      onChanged: (value) {
                        authCubit.specialization = value;
                      },
                    ),
                  ),
                  Gap(15),
                  Text("نبذة تعريفية "),
                  TextFormField(
                    controller: authCubit.aboutController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل نبذة تعريفية عنك";
                      }
                      return null;
                    },
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText:
                          "سجل المعلومات الطبية العملة مثل تعليمك الاكاديمي و خبراتك السابقة ",
                    ),
                  ),
                  Gap(15),
                  Divider(),
                  Gap(15),
                  Text("عنوان العيادة "),
                  TextFormField(
                    controller: authCubit.locationController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل عنوان العيادة";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "15 شارع احمد عرابي ",
                    ),
                  ),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ساعات العمل من "),
                            Gap(5),
                            TextFormField(
                              controller: TextEditingController(
                                text: authCubit.selectedStartTime,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى ادخال وقت البدء';
                                }
                                return null;
                              },
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay? picked = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (picked != null) {
                                  setState(() {
                                    authCubit.selectedStartTime = picked.hour
                                        .toString();
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                hintText:
                                    authCubit.selectedStartTime ??
                                    "${DateFormat("hh:mm").format(DateTime.now())}",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("الى "),
                            Gap(5),
                            TextFormField(
                              controller: TextEditingController(
                                text: authCubit.selectedendTime,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى ادخال وقت الانتهاء';
                                }
                                return null;
                              },
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay? picked = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (picked != null) {
                                  setState(() {
                                    authCubit.selectedendTime = picked.hour
                                        .toString();
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                hintText:
                                    authCubit.selectedendTime ??
                                    "${DateFormat("hh:mm").format(DateTime.now())}",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(15),

                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى ادخال رقم الهاتف';
                      }
                      return null;
                    },
                    controller: authCubit.phoneDoctoreg1Controller,
                    decoration: InputDecoration(hintText: "رقم الهاتف 1"),
                  ),
                  Gap(15),
                  TextFormField(
                    controller: authCubit.phoneDoctoregController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى ادخال رقم الهاتف';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "رقم الهاتف 2"),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8),
          child: MainBottom(
            title: "التالي",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                authCubit.updateDoctorData(FireHelper.auth.currentUser!.uid);
              }
            },
          ),
        ),
      ),
    );
  }
}

List<String> specializations = [
  "امراض القلب والاوعية",

  "الامراض الباطنية",
  "الامراض الجلدية",
  "الامراض النفسية",
  "الاطفال",
  "النساء والتوليد",
  "الجراحة العامة",

  "الاعصاب",
  "الاورام",
  "العيون",
  "الانف والاذن والحنجرة",

  "الاسنان",
  "التخسيس والتغذية",
  "الطب الرياضي",
  "الطب الطبيعي والتأهيل",

  "الطب النفسي",
  "الطب النسائي",
];
