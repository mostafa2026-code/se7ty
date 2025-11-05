import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/core/services/firebase/fire_helper.dart';
import 'package:se7ty/core/utils/my_colors.dart';
import 'package:se7ty/features/auth/data/doctors_model.dart';

import 'package:se7ty/features/home/pages/home_screen.dart';

class SearchBySpeciality extends StatefulWidget {
  const SearchBySpeciality({super.key, required this.speciality});
  final String speciality;

  @override
  State<SearchBySpeciality> createState() => _SearchBySpecialityState();
}

class _SearchBySpecialityState extends State<SearchBySpeciality> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: Text(
          widget.speciality,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                textInputAction: TextInputAction.search,

                onFieldSubmitted: (value) {
                  FireStoreHelper.getDoctorByNameAndSpecilaity(
                    value,
                    widget.speciality,
                  );
                },

                decoration: InputDecoration(
                  hintText: "البحث",
                  prefixIcon: Icon(Icons.search, color: MyColors.primary),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                ),
              ),
            ),
            const Gap(20),
            if (searchText.isEmpty) AllDoctorInSpeciality(widget: widget),
            if (searchText.isNotEmpty)
              FutureBuilder(
                future: FireStoreHelper.getDoctorByNameAndSpecilaity(
                  searchText,
                  widget.speciality,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData &&
                      snapshot.data!.docs.isNotEmpty) {
                    final doctors = snapshot.data!.docs
                        .map((e) => DoctorsModel.fromJson(e.data()))
                        .toList();
                    return DoctorsListView(doctors: doctors);
                  } else {
                    return const Center(
                      child: Text("لا يوجد أطباء لعرضهم الآن"),
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}

class AllDoctorInSpeciality extends StatelessWidget {
  const AllDoctorInSpeciality({super.key, required this.widget});

  final SearchBySpeciality widget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireStoreHelper.firestore
          .collection(FireStoreHelper.doctorKey)
          .orderBy("rating")
          .where("specialization", isEqualTo: widget.speciality)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          final doctors = snapshot.data!.docs
              .map((e) => DoctorsModel.fromJson(e.data()))
              .toList();
          return DoctorsListView(doctors: doctors);
        } else {
          return const Center(child: Text("لا يوجد أطباء لعرضهم الآن"));
        }
      },
    );
  }
}
