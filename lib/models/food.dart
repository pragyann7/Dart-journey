enum FoodCategory { veg, nonVeg, dessert }

class Food {
  String name;
  double price;
  int quantity;
  FoodCategory category;

  Food({
    required this.name,
    required this.price,
    required this.quantity,
    required this.category,
  });

  double get total {
    return price * quantity;
  }
}
