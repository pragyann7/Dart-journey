enum FoodCategory { veg, nonveg, dessert }

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
    Food(name: "Momo", price: 120, quantity: 3, category: FoodCategory.nonveg),
    Food(
      name: "Burger",
      price: 180,
      quantity: 2,
      category: FoodCategory.veg,
    ),
    Food(name: "Pizza", price: 250, quantity: 1, category: FoodCategory.veg),
    Food(
      name: "Brot Cake",
      price: 70,
      quantity: 4,
      category: FoodCategory.dessert,
    ),
  ];

  int count = 0;

  for (var food in foods) {
    print("${food.name} - Rs. ${food.price} - ${food.category}");
    if (food.category == FoodCategory.veg) {
      count++;
    }
  }
  print("---------------------------");
  print("Total vegetarian foods: ${count}");
}
