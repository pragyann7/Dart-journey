void main() {
  List<Map<String, dynamic>> foods = [
    {"name": "Momo", "description": "Steamed dumplings", "price": 120.0},
    {"name": "Burger", "description": null, "price": 180.0},
    {"name": "Pizza", "description": "Cheesy Italian pizza", "price": 250.0},
  ];

  printFood(foods);
}

void printFood(List<Map<String, dynamic>> foods) {
  for (var food in foods) {
    print(
      "${food["name"]} - ${food["description"] ?? "No description available"} - Rs. ${food["price"]}",
    );
  }
}
