void main() {
  // //List
  // List<String> Foods = ["Burger", "Momo", "Pizza"];
  // List<double> Prices = [180, 120, 250];

  // for (var Food in Foods) {
  //   print(Food);
  // }

  // for (var Price in Prices) {
  //   print(Price);
  // }

  // print("--------------\n\n\n\n");

  // //Map
  // List<Map<String, dynamic>> foods = [
  //   {"name": "Burger", "price": "180"},
  //   {"name": "Momo", "price": "120"},
  //   {"name": "Pizza", "price": "250"},
  // ];

  // for (var food in foods) {
  //   print("${food["name"]}: ${food["price"]}");
  // }

  // Task
  double total = 0;
  double averagePrice = 0;
  double price = 0;
  String expensiveFood = "";

  List<Map<String, dynamic>> foods = [
    {"name": "Burger", "price": 180.0},
    {"name": "Momo", "price": 120.0},
    {"name": "Pizza", "price": 250.0},
    {"name": "Creme Brule", "price": 290.0},
    {"name": "Chaumin", "price": 100.0},
  ];

  for (var food in foods) {
    total += food["price"];
    if (food["price"] > price) {
      price = food["price"];
      expensiveFood = food["name"];
    }
  }
  averagePrice = total / foods.length;

  for (var food in foods) {
    print("${food["name"]}: ${food["price"]}");
  }

  print("-------------------------");
  print("${total}\n${averagePrice}\n${expensiveFood}: ${price}");
}
