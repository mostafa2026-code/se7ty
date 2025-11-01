import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:se7ty/core/utils/my_colors.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.primary,
        title: const Text(
          'مواعيد الحجز',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    title: Text("د. علي زن خالد"),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'د. علي زن خالد',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0078AA),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Date and time row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.calendar_1,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    '23-11-2023',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.clock,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    '04:00',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),
                          const Text(
                            'اليوم',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const Divider(height: 20),

                          // Patient name
                          const Text(
                            'اسم المريض: علي زن خالد ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 5),

                          // Address
                          const Row(
                            children: [
                              Icon(
                                Iconsax.location,
                                size: 18,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  '٤٣ شارع الجامعه، مدينة نصر، القاهرة',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Delete button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              child: const Text(
                                'حذف الحجز',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),

            // Doctor name
          ],
        ),
      ),
    );
  }
}
