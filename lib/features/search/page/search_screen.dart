import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/core/utils/my_image.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
              decoration: InputDecoration(
                hintText: "بحث",
                suffixIcon: SizedBox(width: 20, child: Icon(Icons.search)),
              ),
            ),
            Expanded(
              child: Center(
                child: SvgPicture.asset(MyImage.onsearch, height: 300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
