class Food {
  String name;
  double price;
  int quantity;
  String? description;

  Food(this.name, this.price, this.quantity, this.description);

  double calculateTotal(price, quantity) {
    return price * quantity;
  }
}

void main() {
  List<Food> foods = [
    Food("Momo", 120, 3, "Steamed dumplings"),
    Food("Burger ", 180, 2, null),
    Food("Pizza", 250, 1, "Cheesy Italian pizza"),
    Food("Brot", 70, 4, "French brot"),
  ];

  double total = 0;

  for (var food in foods) {
    total += food.calculateTotal(food.price, food.quantity);
    print(
      "${food.name} - ${food.description ?? "No description available"} - Rs. ${food.price} x ${food.quantity} = Rs. ${food.calculateTotal(food.price, food.quantity)}",
    );
  }

  print("--------------------------------------------");
  print("Total: ${total}");
}
