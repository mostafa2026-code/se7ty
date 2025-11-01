import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:se7ty/core/utils/my_colors.dart';
import 'package:se7ty/features/%D9%85%D9%88%D8%A7%D8%B9%D9%8A%D8%AF/pages/appoinment.dart';
import 'package:se7ty/features/doctor/profile/pages/profile_screen.dart';
import 'package:se7ty/features/home/pages/home_screen.dart';
import 'package:se7ty/features/search/page/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> pagesPateint = [
    const HomeScreen(),
    const SearchScreen(),
    const AppointmentScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesPateint[currentIndex],
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,
        activeColor: Colors.white,
        color: MyColors.primary,
        tabBackgroundColor: MyColors.primary,
        tabMargin: EdgeInsets.all(2),

        gap: 8,

        style: GnavStyle.google,
        selectedIndex: currentIndex,
        onTabChange: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        tabs: const [
          GButton(icon: Icons.home, text: 'الرئيسية'),
          GButton(icon: Icons.search, text: 'البحث'),
          GButton(icon: Icons.calendar_month, text: 'المواعيد'),
          GButton(icon: Icons.person, text: 'الحساب'),
        ],
      ),
    );
  }
}
