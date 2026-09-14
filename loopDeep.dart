void main() {
  List<Map<String, dynamic>> foods = [
    {"name": "Burger", "price": 180.0},
    {"name": "Momo", "price": 120.0},
    {"name": "Pizza", "price": 250.0},
    {"name": "Creme Brule", "price": 290.0},
    {"name": "Chaumin", "price": 100.0},
    {"name": "Katti Roll", "price": 150.0},
  ];

  double total = 0;
  double price = foods[0]["price"];
  int count = 0;
  String expensiveFood = "";

  for (var food in foods) {
    total += food["price"];
    if (food["price"] > price) {
      price = food["price"];
      expensiveFood = food["name"];
    }
    if (food["price"] > 200) {
      count++;
    }
  }

  for (var i = 0; i < foods.length; i++) {
    print("${i + 1}. ${foods[i]["name"]}: ${foods[i]["price"]}");
  }

  print("----------------------------");
  print(
    "Total: ${total}\nMost expensive ${expensiveFood} - ${price}\nFoods above 200: ${count}",
  );
}
