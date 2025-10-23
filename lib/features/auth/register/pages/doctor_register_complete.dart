import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/component/main_bottom.dart';
import 'package:se7ty/core/utils/my_colors.dart';
import 'package:intl/intl.dart';

class DoctorRegisterComplete extends StatelessWidget {
  const DoctorRegisterComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اكمال عملية التسجيل'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(radius: 80),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Icon(Icons.camera_alt),
                      ),
                    ],
                  ),
                ],
              ),
              Gap(15),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "التخصص",
                  suffix: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_drop_down, color: MyColors.primary),
                  ),
                ),
              ),
              Gap(15),
              Text("نبذة تعريفية "),
              TextFormField(
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
                decoration: InputDecoration(hintText: "15 شارع احمد عرابي "),
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
                          onTap: () {
                            TimePickerDialog(initialTime: TimeOfDay.now());
                          },
                          decoration: InputDecoration(
                            hintText:
                                "${DateFormat("hh:mm").format(DateTime.now())} ",
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
                          readOnly: true,
                          onTap: () {
                            TimePickerDialog(initialTime: TimeOfDay.now());
                          },
                          decoration: InputDecoration(
                            hintText:
                                "${DateFormat("hh:mm").format(DateTime.now())} ",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              TextFormField(
                decoration: InputDecoration(hintText: "رقم الهاتف 1"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "رقم الهاتف 2"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8),
        child: MainBottom(title: "التالي"),
      ),
    );
  }
}
