class Food{
  String name;
  double price;
  int quantity;

  Food({required this.name, required this.price, required this.quantity});

  double get total{
    return price * quantity;
  }

  set updatePrice(double newPrice){
    if (newPrice >= 0) {
      price = newPrice;
    }
  }
}

void main(){
  Food momo = Food(name: "Momo", price: 120, quantity: 2);
  print("Total: ${momo.total}");
  momo.updatePrice = 150;
  momo.updatePrice = -100;
  print("Price: ${momo.price}");
  print("Retotal: ${momo.total}");
}