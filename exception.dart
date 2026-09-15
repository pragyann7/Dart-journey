class Order {
  String foodName;
  double price;
  int quantity;

  Order({required this.foodName, required this.price, required this.quantity});

  double calculateTotal() {
    if (price < 0) {
      throw Exception("${foodName} price should not be negative!");
    }
    if (quantity <= 0) {
      throw Exception("${foodName} quantity should be greater than zero!");
    }
    return price * quantity;
  }
}

void main() {
  List<Order> orders = [
    Order(foodName: "Momo", price: -100, quantity: 2),
    Order(foodName: "Pizza", price: 250, quantity: 0),
    Order(foodName: "Burger", price: 180, quantity: 1),
    Order(foodName: "Cake", price: 200, quantity: 2),
  ];

  double total = 0;

  for (var order in orders) {
    try {
      total += order.calculateTotal();
      print("${order.foodName} - Rs. ${order.calculateTotal()}");
    } catch (e) {
      print("Invalid order: $e");
    } finally {
      print("Order checked.");
    }
  }
  print("------------------------------");
  print("Total: ${total}");
}
