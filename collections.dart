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
    Food(
      name: "Brot Cake",
      price: 70,
      quantity: 4,
      category: FoodCategory.dessert,
    ),
    Food(
      name: "Dal Bhat",
      price: 350,
      quantity: 1,
      category: FoodCategory.nonVeg,
    ),
  ];

  var vegetarianFoods = foods.where(
    (food) => food.category == FoodCategory.veg,
  );
  var foodNames = foods.map((food) => food.name);
  var totalValue = foods.fold(
    0.0,
    (sum, food) => sum + (food.price * food.quantity),
  );

  print("Vegetarian foods:");
  for (var food in vegetarianFoods) {
    print(food);
  }
  print("Food names:");
  for (var food in foodNames) {
    print(food);
  }
  print("Total: Rs. ${totalValue}");
}
