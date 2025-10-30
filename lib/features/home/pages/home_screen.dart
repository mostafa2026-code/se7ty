import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/core/services/shared/shared_pref.dart';
import 'package:se7ty/core/utils/my_colors.dart';
import 'package:se7ty/core/utils/my_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffeffff),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xfffeffff),
        title: Text("صحتي"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active, color: MyColors.primary),
          ),
        ],
        titleTextStyle: TextStyle(
          color: MyColors.black,
          fontSize: 22,
          fontFamily: "cairo",
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        " مرحبا,",
                        style: TextStyle(fontSize: 16, color: MyColors.black),
                      ),
                      Text(
                       "mostafa",
                        style: TextStyle(fontSize: 16, color: MyColors.primary),
                      ),
                    ],
                  ),
                  Gap(20),
                  Text(
                    "احجز الان و كن جزءا من رحلتك الصحية ",
                    style: TextStyle(fontSize: 24),
                  ),
                  Gap(20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: " ابحث عن دكتور ",
                      suffixIcon: SearchContainer(),
                    ),
                  ),
                  Gap(20),
                  Text("التخصصات ", style: HomeHeadlineTExtStyle()),
                  Gap(20),

                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return Gap(10);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(color: Color(0xff7ebdfb)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                MyImage.docCard,
                                width: 120,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                "جراحة قلب",
                                style: TextStyle(
                                  color: MyColors.whitepure,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(20),
                  Text("الاعلي تقيما", style: HomeHeadlineTExtStyle()),
                  SizedBox(
                    width: double.infinity,

                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      separatorBuilder: (BuildContext context, int index) {
                        return Gap(10);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Color(0xffe6eef8)),

                          child: ListTile(
                            leading: SizedBox(
                              width: 30,
                              child: SvgPicture.asset(
                                MyImage.onboarding1,
                                height: double.infinity,
                              ),
                            ),

                            minTileHeight: 100,
                            title: Text("مصطفى عبد الرحيم  ابراهيم "),
                            subtitle: Text("طب النونات "),
                            trailing: SizedBox(
                              width: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("4"),
                                  Icon(Icons.star, size: 20),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TextStyle HomeHeadlineTExtStyle() =>
      const TextStyle(fontSize: 16, color: MyColors.primary);
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(0),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: MyColors.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.search, color: Colors.white),
      ),
    );
  }
}
