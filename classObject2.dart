class Food {
  String name;
  double price;
  int quantity;
  String? description;

  Food({required this.name, required this.price, required this.quantity, this.description});

  double calculateTotal() {
    return price * quantity;
  }
}

void main() {
  List<Food> foods = [
    Food(name: "Momo", price: 120, quantity:  3, description:  "Steamed dumplings"),
    Food(name: "Burger", price: 180, quantity:  2, description:  null),
    Food(name: "Pizza", price: 250, quantity:  1, description:  "Cheesy Italian pizza"),
    Food(name: "Brot", price: 70,  quantity: 4, description:  "French brot"),
  ];

  double total = 0;

  for (var food in foods) {
    total += food.calculateTotal();
    print(
      "${food.name} - ${food.description ?? "No description available"} - Rs. ${food.price} x ${food.quantity} = Rs. ${food.calculateTotal()}",
    );
  }

  print("--------------------------------------------");
  print("Total: ${total}");
}
