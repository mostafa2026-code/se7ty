import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("حجز المواعيد")),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) {
                      return Gap(10);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ExpansionTile(
                        title: Text("د/مصطفى عبدالرحيم"),
                        childrenPadding: EdgeInsets.all(8),
                        children: [
                          

                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
