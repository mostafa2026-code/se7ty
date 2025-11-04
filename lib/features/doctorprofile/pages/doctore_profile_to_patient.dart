import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/component/main_bottom.dart';
import 'package:se7ty/core/utils/my_colors.dart';
import 'package:se7ty/features/auth/data/doctors_model.dart';

class DoctoreProfileToPatient extends StatelessWidget {
  final DoctorsModel model;
  const DoctoreProfileToPatient({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    log(model.profileImage.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "بيانات الدكتور",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Container(
                    child: Image.network(
                      model.profileImage ?? "",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(20),
                Column(
                  children: [
                    Text(
                      model.name ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      model.specialization ?? "",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          model.rating.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "نبذة تعريفية",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              model.about ?? "",
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xffe6eef8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.access_time, color: MyColors.primary),
                      const SizedBox(width: 6),
                      Text("${model.tohour} - ${model.fromhour}"),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on, color: MyColors.primary),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          model.location ?? '',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "معلومات الاتصال",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: model.email,
                        queryParameters: {'subject': 'subject', 'body': ''},
                      );
                      launchUrl(emailLaunchUri);
                    },
                    leading: const Icon(Icons.email, color: MyColors.primary),
                    title: Text(model.email ?? ""),
                  ),
                  ListTile(
                    onTap: () {
                      final Uri phoneLaunchUri = Uri(
                        scheme: 'tel',
                        path: model.phone1,
                      );
                      launchUrl(phoneLaunchUri);
                    },
                    leading: const Icon(Icons.phone, color: MyColors.primary),
                    title: Text(model.phone1 ?? ""),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            MainBottom(onPressed: () {}, title: "احجز موعد "),
          ],
        ),
      ),
    );
  }
}
