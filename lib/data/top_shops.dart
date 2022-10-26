class TopShops {
  final int? id;
  final String? name;
  final String? location;
  final String? image;
  final double rating;
  final String? distance;
  final String? timeDuration;

  const TopShops(
      {this.id,
      this.name,
      this.image,
      this.location,
      this.rating = 0,
      this.distance,
      this.timeDuration});
}

class TopShopList {
  static List<TopShops> list() {
    const data = <TopShops>[
      TopShops(
          id: 1,
          name: 'Burger King - Mt. Lavinia',
          rating: 3,
          distance: "2KM",
          timeDuration: "6 - 10 min",
          image: "assets/images/top_of_week_one.jpg",
          location: "Western, cuisine, Fast Food, Burger"),
      TopShops(
          id: 2,
          name: 'Burger King - Mt. Lavinia',
          rating: 2,
          distance: "2KM",
          timeDuration: "6 - 10 min",
          image: "assets/images/top_of_week_two.jpg",
          location: "Western, cuisine, Fast Food, Burger"),
      TopShops(
          id: 3,
          name: 'Burger King - Mt. Lavinia',
          rating: 5,
          distance: "2KM",
          timeDuration: "6 - 10 min",
          image: "assets/images/top_of_week_three.jpg",
          location: "Western, cuisine, Fast Food, Burger"),
      TopShops(
          id: 4,
          name: 'Burger King - Mt. Lavinia',
          rating: 4,
          distance: "2KM",
          timeDuration: "6 - 10 min",
          image: "assets/images/top_of_week_one.jpg",
          location: "Western, cuisine, Fast Food, Burger"),
    ];
    return data;
  }
}
