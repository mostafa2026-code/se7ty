import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreenDoctor extends StatelessWidget {
  MainScreenDoctor({super.key});

  final String uid = FirebaseAuth.instance.currentUser!.uid;

  Future<DocumentSnapshot> getDoctorData() async {
    return await FirebaseFirestore.instance
        .collection("doctors")
        .doc(uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Profile"),
        backgroundColor: Colors.blue[800], // اللون الأزرق الداكن
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: getDoctorData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("No data found"));
          }

          var data = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // صورة الطبيب
                data['profileImage'] != null
                    ? Image.network(
                        data['profileImage'],
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.person,
                            size: 120,
                            color: Colors.blue,
                          );
                        },
                      )
                    : const Icon(Icons.person, size: 120, color: Colors.blue),
                const SizedBox(height: 20),

                // اسم الطبيب
                Text(
                  data['name'] ?? 'No Name',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),

                // البريد الإلكتروني
                Text(
                  data['email'] ?? 'No Email',
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 10),

                // التخصص
                Text(
                  data['specialization'] ?? 'No Specialization',
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
