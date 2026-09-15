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
}

void main() {
  List<Food> foods = [
    Food(name: "Momo", price: 120, quantity: 3, category: FoodCategory.nonVeg),
    Food(name: "Burger", price: 180, quantity: 2, category: FoodCategory.veg),
    Food(name: "Pizza", price: 250, quantity: 1, category: FoodCategory.veg),
  ];

  var vegetarianFood = foods
      .where((food) => food.category == FoodCategory.veg)
      .toList();

  for (var food in foods) {
    print("${food.name} ${food.price}");
  }

  for (var veg in vegetarianFood) {
    foods.add(veg);
  }

  print("-----------------------------------");

  for (var food in foods) {
    print("${food.name} ${food.price}");
  }
}
