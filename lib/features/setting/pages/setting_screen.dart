import 'package:flutter/material.dart';
import 'package:se7ty/core/navigation/my_navigation.dart';
import 'package:se7ty/core/utils/my_colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الاعدادت")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [SettingColumn()],
          ),
        ),
      ),
    );
  }
}

class SettingColumn extends StatelessWidget {
  const SettingColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SettingListTile(leading: Icons.person, title: "اعدادت الحساب", to: ""),
        SettingListTile(leading: Icons.security, title: "كلمة السر ", to: ""),
        SettingListTile(
          leading: Icons.person,
          title: "اعدادت الاشعارات ",
          to: "",
        ),
        SettingListTile(
          leading: Icons.notifications_active,
          title: "الخصوصية ",
          to: "",
        ),
        SettingListTile(
          leading: Icons.help,
          title: "المساعدة  والدعم ",
          to: "",
        ),
        SettingListTile(
          leading: Icons.person_add_alt,
          title: "دعوة صديق ",
          to: "",
        ),
      ],
    );
  }
}

class SettingListTile extends StatelessWidget {
  final String title;
  final String to;
  final IconData leading;

  const SettingListTile({
    super.key,
    required this.title,
    required this.to,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide.none,
      ),
      child: ListTile(
        minTileHeight: 50,

        iconColor: MyColors.primary,

        title: Text(title),
        trailing: IconButton(
          onPressed: () {
            push(context, to, null);
          },
          icon: Icon(Icons.arrow_forward),
        ),
        leading: Icon(leading),
      ),
    );
  }
}
