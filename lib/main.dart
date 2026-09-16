import "models/food.dart";

void main() {
  List<Food> foods = [
    Food(name: "Momo", price: 120, quantity: 3, category: FoodCategory.nonVeg),
    Food(name: "Burger", price: 80, quantity: 2, category: FoodCategory.veg),
    Food(name: "Pizza", price: 250, quantity: 1, category: FoodCategory.veg),
    Food(
      name: "Brot Cake",
      price: 70,
      quantity: 4,
      category: FoodCategory.dessert,
    ),
  ];

  for (var food in foods) {
    print("${food.name} - Rs. ${food.price} - Total: Rs. ${food.total}");
  }
  print("---------------------------------");
  var total = foods.fold(0.0, (sum, food) => sum + food.total);
  print("Total: ${total}");
}
