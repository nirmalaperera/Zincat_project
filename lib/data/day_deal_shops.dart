class DayDealsShops {
  final int? id;
  final String? name;
  final String? location;
  final String? image;
  final double rating;
  final String? distance;
  final String? timeDuration;

  const DayDealsShops(
      {this.id,
      this.name,
      this.image,
      this.location,
      this.rating = 0,
      this.distance,
      this.timeDuration});
}

class DayDealShopList {
  static List<DayDealsShops> list() {
    const data = <DayDealsShops>[
      DayDealsShops(
          id: 1,
          name: 'Burger King - Mt. Lavinia',
          rating: 3,
          distance: "2KM",
          timeDuration: "6 - 10 min",
          image: "assets/images/deal_one.jpg",
          location: "Western, cuisine, Fast Food, Burger"),
      DayDealsShops(
          id: 2,
          name: 'Burger King - Mt. Lavinia',
          rating: 2,
          distance: "2KM",
          timeDuration: "6 - 10 min",
          image: "assets/images/deal_two.jpg",
          location: "Western, cuisine, Fast Food, Burger"),
      DayDealsShops(
          id: 3,
          name: 'Burger King - Mt. Lavinia',
          rating: 5,
          distance: "2KM",
          timeDuration: "6 - 10 min",
          image: "assets/images/deal_three.jpg",
          location: "Western, cuisine, Fast Food, Burger"),
      DayDealsShops(
          id: 4,
          name: 'Burger King - Mt. Lavinia',
          rating: 4,
          distance: "2KM",
          timeDuration: "6 - 10 min",
          image: "assets/images/deal_two.jpg",
          location: "Western, cuisine, Fast Food, Burger"),
    ];
    return data;
  }
}
