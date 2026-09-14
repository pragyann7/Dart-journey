void main() {
  double Burger = 250;
  double Pizza = 500;
  double Momo = 180;

  double total;
  double subtotal;
  double discount;
  var delivery;

  total = (Burger * 2) + (Pizza * 1) + (Momo * 3);

  subtotal = total;

  if (total >= 1500) {
    discount = total * 10 / 100;
    total -= discount;
  } else {
    discount = 0;
  }

  if (subtotal >= 1000) {
    delivery = 0;
  } else {
    delivery = 100;
    total += 100;
  }

  print("\nBurger: ${Burger * 2}\nPizza: ${Pizza * 1}\nMomo: ${Momo * 3}\n");
  print("----------------------------");
  print(
    "\nSubtotal: ${subtotal}\nDiscount: ${discount}\nDelivery: ${delivery}\nFinal Total: ${total}",
  );
}
