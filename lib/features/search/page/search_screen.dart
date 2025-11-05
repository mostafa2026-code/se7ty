import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/core/services/firebase/fire_helper.dart';
import 'package:se7ty/core/utils/my_image.dart';
import 'package:se7ty/features/auth/data/doctors_model.dart';
import 'package:se7ty/features/home/pages/home_screen.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" ابحث عن دكتور")),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(20),

            TextFormField(
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
              decoration: InputDecoration(
                hintText: "بحث",
                suffixIcon: SizedBox(width: 20, child: Icon(Icons.search)),
              ),
            ),
            if (search.isNotEmpty)
              FutureBuilder(
                future: FireStoreHelper.getDoctorByName(search),
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
              )
            else
              const Gap(29),
            const TopRatedDoctorsList(),
          ],
        ),
      ),
    );
  }
}

class OnSearchWIdget extends StatelessWidget {
  const OnSearchWIdget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(child: SvgPicture.asset(MyImage.onsearch, height: 300)),
    );
  }
}
