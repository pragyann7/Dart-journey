class Food {
  String name;
  double price;
  String? description;

  Food(this.name, this.price, this.description);
}

void main() {
  List<Food> foods = [
    Food("Momo", 120, "Steamed dumplings"),
    Food("Burger ", 180, null),
    Food("Pizza", 250, "Cheesy Italian pizza"),
  ];

  printFood(foods);
  print("--------------------------------");
  searchFood(foods);
}

void printFood(List<Food> foods) {
  for (var food in foods) {
    print(
      "${food.name} - ${food.description ?? "No description available"} - Rs. ${food.price}",
    );
  }
}

//Advance for Search Functionality
void searchFood(List<Food> foods) {
  String searchTerm = "momo";
  List<Food> searchResults = foods.where((food) {
    String name = food.name.toLowerCase();
    String query = searchTerm.toLowerCase();

    return name.contains(query);
  }).toList();

  print("Search results for ${searchTerm}: ");
  for (var result in searchResults) {
    print("- ${result.name}");
  }
}
