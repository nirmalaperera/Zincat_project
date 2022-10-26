class Category {
  final int? id;
  final String? name;
  final String? image;

  const Category({this.id, this.name, this.image});
}

class CategoryList {
  static List<Category> list() {
    const data = <Category>[
      Category(id: 1, name: 'Taxi', image: "assets/images/taxi.png"),
      Category(id: 2, name: 'Food', image: "assets/images/dish.png"),
      Category(id: 3, name: 'Grocery', image: "assets/images/grocery.png"),
      Category(id: 4, name: 'Drink', image: "assets/images/beer.png"),
    ];
    return data;
  }
}
