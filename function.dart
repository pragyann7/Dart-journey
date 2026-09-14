void main() {
  List<Map<String, dynamic>> foods = [
    {"name": "Burger", "price": 180.0, "quantity": 2},
    {"name": "Momo", "price": 120.0, "quantity": 3},
    {"name": "Pizza", "price": 250.0, "quantity": 1},
    {"name": "Chowmein", "price": 150.0, "quantity": 2},
  ];

  double discount = 0;
  double delivery = 100;
  double subtotal = calculateSubtotal(foods);
  double finalTotal = subtotal;

  if (subtotal >= 1000) {
    discount = finalTotal * 10 / 100;
    finalTotal -= discount;
  }

  if (subtotal < 1000) {
    finalTotal += delivery;
  }
  else{
    delivery = 0;
  }

  printBill(foods, subtotal, discount, delivery, finalTotal);
}

double calculateItemTotal(double price, int quantity){
  return price * quantity;
}

double calculateSubtotal(List<Map<String, dynamic>> foods){
  double subTotal = 0;
  for(var food in foods){
    subTotal += calculateItemTotal(food["price"], food["quantity"]);
  }
  return subTotal;
}

void printBill(List<Map<String, dynamic>> foods, double subtotal, double discount, double delivery, double finalTotal){
  print("-----------------------------------------------------------------------------");
  print("RESTAURANT BILL");
  print("-----------------------------------------------------------------------------");
  for(int i=0; i < foods.length; i++){
    print("${i+1}. ${foods[i]["name"]} - Rs. ${foods[i]["price"]} x ${foods[i]["quantity"]} = Rs. ${calculateItemTotal(foods[i]["price"], foods[i]["quantity"])}");
  }
  print("-----------------------------------------------------------------------------");
  print("Subtotal: ${subtotal}\nDiscount: ${discount}\nDelivery: ${delivery}\nFinal Total: ${finalTotal}");
}