class Order {
  String foodName;
  double price;
  int quantity;

  Order({required this.foodName, required this.price, required this.quantity});

  Future<double> processOrder() async {
    await Future.delayed(Duration(seconds: 2));
    if (price < 0) {
      throw Exception("${foodName} price should not be negative!");
    }

    if (quantity <= 0) {
      throw Exception("${foodName} quantity should be greater than zero!");
    }
    return price * quantity;
  }
}

Future<void> main() async {
  List<Order> orders = [
    Order(foodName: "Momo", price: -100, quantity: 2),
    Order(foodName: "Pizza", price: 250, quantity: 0),
    Order(foodName: "Burger", price: 180, quantity: 1),
    Order(foodName: "Cake", price: 200, quantity: 2),
  ];

  var result;
  double total = 0;

  for (var order in orders) {
    print("Processing ${order.foodName}...");
    try {
      result = await order.processOrder();
      print("${order.foodName} total: Rs. ${result}");
      total += result;
    } catch (e) {
      print("Invalid order: $e");
    }
  }
  print("-----------------------------");
  print("Total: ${total}");
}
