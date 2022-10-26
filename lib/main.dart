import 'package:flutter/material.dart';
import 'package:zincat_project/screens/main_home_screen.dart';
import 'package:zincat_project/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
        ),
        home: const MainHomeScreen());
  }
}
