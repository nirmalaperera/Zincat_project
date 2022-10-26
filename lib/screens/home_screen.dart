import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zincat_project/data/category.dart';
import 'package:zincat_project/data/day_deal_shops.dart';
import 'package:zincat_project/data/explore_shops.dart';
import 'package:zincat_project/data/top_shops.dart';
import 'package:zincat_project/screens/widgets/day_deal_shop_card.dart';
import 'package:zincat_project/screens/widgets/explore_shop_card.dart';
import 'package:zincat_project/screens/widgets/top_shop_card.dart';
import 'package:zincat_project/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categoryList = [];
  int _selctedCategoryIndex = 0;
  List<DayDealsShops> shopList = [];
  List<TopShops> topShopList = [];
  List<ExploreShops> exploreShopList = [];
  @override
  void initState() {
    categoryList = CategoryList.list();
    shopList = DayDealShopList.list();
    topShopList = TopShopList.list();
    exploreShopList = ExploreShopList.list();
    _selectTheme();
    super.initState();
  }

  String selectedImage = "";
  String dayImage = "assets/images/day_home.png";
  String nightImage = "assets/images/night_home.png";
  late Timer _timer;
  _selectTheme() {
    DateTime now = DateTime.now();
    DateTime night = DateTime(now.year, now.month, now.day, 19);
    DateTime morning = DateTime(now.year, now.month, now.day, 6);

    int timerSeconds;

    if (now.compareTo(morning) > 0 && now.compareTo(night) < 0) {
      selectedImage = dayImage;
      timerSeconds = night.difference(now).inSeconds;
    } else if (now.compareTo(night) > 0) {
      selectedImage = nightImage;
      DateTime nextDayMorningTime = night.add(const Duration(days: 1));
      timerSeconds = nextDayMorningTime.difference(now).inSeconds;
    } else {
      selectedImage = nightImage;
      timerSeconds = morning.difference(now).inSeconds;
    }

    _timer = Timer(
      Duration(seconds: timerSeconds),
      () {
        _selectTheme();
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        selectedImage,
                      ),
                      fit: BoxFit.fill,
                    )),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                            left: 15,
                            right: 15,
                            bottom: 15,
                          ),
                          child: TextField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              fillColor: AppColors.white,
                              filled: true,
                              hintStyle: TextStyle(
                                  color: AppColors.shadowBlack,
                                  fontWeight: FontWeight.w500),
                              contentPadding: const EdgeInsets.all(0),
                              suffixIcon: Icon(
                                Icons.qr_code_scanner_rounded,
                                color: AppColors.black,
                              ),
                              hintText: "How Can I Help You?",
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.black,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.shadowBlack, width: 0),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0)),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Hi Kasun",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    var category = categoryList[index];
                    return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selctedCategoryIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              color: _selctedCategoryIndex == index
                                  ? AppColors.yellow
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(-1, -1),
                                  color: AppColors.shadowBlack,
                                  blurRadius: 5,
                                ),
                                BoxShadow(
                                  offset: const Offset(1, 1),
                                  color: AppColors.shadowBlack,
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  category.image.toString(),
                                  height: 50,
                                  width: 50,
                                ),
                                Text(
                                  "${category.name}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black),
                                ),
                              ],
                            ),
                          ),
                        ));
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Deals of the Day",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            CardWidget(
              shopList: shopList,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top of this Week",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            TopShopCardWidget(
              shopList: topShopList,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore More",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            ExploreShopCardWidget(
              shopList: exploreShopList,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
