import 'package:flutter/material.dart';
import 'package:zincat_project/screens/home_screen.dart';
import 'package:zincat_project/utils/app_colors.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 1;
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white.withOpacity(0.5),
        iconSize: 40,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
              backgroundColor: AppColors.black,
              icon: const Icon(
                Icons.favorite,
              ),
              label: "________________"),
          BottomNavigationBarItem(
              backgroundColor: AppColors.black,
              icon: const Icon(
                Icons.home,
              ),
              label: "________________"),
          BottomNavigationBarItem(
              backgroundColor: AppColors.black,
              icon: const Icon(
                Icons.person,
              ),
              label: "________________"),
        ],
      ),
      body: screens.elementAt(_selectedIndex),
    );
  }
}
