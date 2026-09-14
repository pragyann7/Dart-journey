enum OrderStatus { pending, preparing, delivered, cancelled }

class Order{
  String foodName;
  double price;
  OrderStatus status;

  Order({required this.foodName, required this.price, required this.status});
}

void main(){
  List<Order> orders = [
    Order(foodName: "Momo", price: 120, status: OrderStatus.delivered),
    Order(foodName: "Pizza", price: 250, status: OrderStatus.pending),
    Order(foodName: "Burger", price: 180, status: OrderStatus.cancelled),
    Order(foodName: "Cake", price: 200, status: OrderStatus.preparing),
  ];

  for(var order in orders){
    switch (order.status) {
      case OrderStatus.preparing:
        print("${order.foodName} - Rs. ${order.price} - ${order.status}");
        break;
      case OrderStatus.cancelled:
        print("${order.foodName} - Rs. ${order.price} - ${order.status}");
        break;
      case OrderStatus.pending:
        print("${order.foodName} - Rs. ${order.price} - ${order.status}");
        break;
      case OrderStatus.delivered:
        print("${order.foodName} - Rs. ${order.price} - ${order.status}");
        break;
    }
  }
}