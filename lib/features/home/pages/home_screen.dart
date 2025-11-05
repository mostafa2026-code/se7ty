import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/core/navigation/my_navigation.dart';
import 'package:se7ty/core/navigation/my_routes.dart';
import 'package:se7ty/core/services/firebase/fire_helper.dart';
import 'package:se7ty/core/utils/my_colors.dart';
import 'package:se7ty/core/utils/my_image.dart';
import 'package:se7ty/features/auth/data/doctors_model.dart';
import 'package:se7ty/features/auth/presentation/register/pages/doctor_register_complete.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffeffff),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xfffeffff),
        title: const Text("صحتي"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
              color: MyColors.primary,
            ),
          ),
        ],
        titleTextStyle: const TextStyle(
          color: MyColors.black,
          fontSize: 22,
          fontFamily: "cairo",
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "مرحبا, ",
                      style: const TextStyle(
                        fontSize: 16,
                        color: MyColors.black,
                      ),
                      children: [
                        TextSpan(
                          text:
                              FirebaseAuth.instance.currentUser!.displayName ??
                              "mostafa",
                          style: const TextStyle(
                            fontSize: 16,
                            color: MyColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  const Text(
                    "احجز الان و كن جزءا من رحلتك الصحية ",
                    style: TextStyle(fontSize: 24),
                  ),
                  const Gap(20),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: " ابحث عن دكتور ",
                      suffixIcon: SearchContainer(),
                    ),
                  ),
                  const Gap(20),
                  Text("التخصصات", style: homeHeadlineTextStyle()),
                  const Gap(20),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 10,
                      separatorBuilder: (context, index) => const Gap(10),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            push(
                              context,
                              MyRoutes.searchBySpeciality,
                              specializations[index],
                            );
                          },
                          child: Container(
                            height: 100,
                            width: 150,
                            decoration: const BoxDecoration(
                              color: Color(0xff7ebdfb),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  MyImage.docCard,
                                  width: 120,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  specializations[index],
                                  style: TextStyle(
                                    color: MyColors.whitepure,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Gap(20),
                  Text("الأعلى تقييمًا", style: homeHeadlineTextStyle()),
                  const TopRatedDoctorsList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle homeHeadlineTextStyle() =>
    const TextStyle(fontSize: 16, color: MyColors.primary);

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: MyColors.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search, color: Colors.white),
      ),
    );
  }
}

/// extracted widget (FutureBuilder)
class TopRatedDoctorsList extends StatelessWidget {
  const TopRatedDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireStoreHelper.firestore
          .collection("doctors")
          .orderBy("rating", descending: true)
          .get(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (asyncSnapshot.hasData &&
            asyncSnapshot.data!.docs.isNotEmpty) {
          final doctors = asyncSnapshot.data!.docs
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

/// extracted widget (ListView itself)
class DoctorsListView extends StatelessWidget {
  final List<DoctorsModel> doctors;

  const DoctorsListView({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: doctors.length,
      separatorBuilder: (context, index) => const Gap(10),
      itemBuilder: (context, index) {
        final model = doctors[index];
        return Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffe6eef8),
          ),
          child: ListTile(
            onTap: () {
              push(context, MyRoutes.doctorProfileofPatient, model);
            },
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                (model.profileImage != null && model.profileImage!.isNotEmpty)
                    ? model.profileImage!
                    : "https://cdn-icons-png.flaticon.com/512/387/387561.png",
                fit: BoxFit.cover,
              ),
            ),
            title: Text(model.name ?? ""),
            subtitle: Text(model.specialization ?? ""),
            trailing: SizedBox(
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(model.rating.toString()),
                  const Icon(Icons.star, size: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
