import 'package:flutter/material.dart';
import 'package:zincat_project/data/explore_shops.dart';
import 'package:zincat_project/screens/widgets/star.dart';
import 'package:zincat_project/utils/app_colors.dart';

class ExploreShopCardWidget extends StatelessWidget {
  final List<ExploreShops> shopList;

  const ExploreShopCardWidget({
    Key? key,
    required this.shopList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: shopList.length,
          itemBuilder: (context, index) {
            var shop = shopList[index];
            return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 320,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              shop.image.toString(),
                              height: 150,
                              width: 320,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shop.name.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black),
                              ),
                              Text(
                                shop.location.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.shadowBlack),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 300,
                                child: Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: AppColors.shadowBlack,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StarDisplayWidget(
                                    value: shop.rating.toDouble(),
                                    filledStar: Icon(Icons.star,
                                        color: AppColors.yellow, size: 20),
                                    unfilledStar: Icon(
                                      Icons.star_border,
                                      color: AppColors.shadowBlack,
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    shop.rating.toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.shadowBlack),
                                  ),
                                  const SizedBox(width: 30),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        color: AppColors.shadowBlack
                                            .withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Text(
                                      shop.distance.toString(),
                                      style: TextStyle(
                                          fontSize: 12, color: AppColors.white),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 70,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        color: AppColors.shadowBlack
                                            .withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Text(
                                      shop.timeDuration.toString(),
                                      style: TextStyle(
                                          fontSize: 12, color: AppColors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
  //  Widget buildRatingStar(int index) {
  //   // if (index < currentRating) {
  //   //   return Icon(
  //   //     Icons.star,
  //   //     color: Colors.yellow,
  //   //   );
  //   // } else {
  //   //   return Icon(
  //   //     Icons.star,
  //   //     color: Colors.white,
  //   //   );
  //   // }
  // }
}
