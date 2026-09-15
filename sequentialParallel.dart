Future<String> getRestaurants() async {
  await Future.delayed(Duration(seconds: 2));
  return "Restaurants loaded";
}

Future<String> getCategories() async {
  await Future.delayed(Duration(seconds: 2));
  return "Categories loaded";
}

Future<String> getOffers() async {
  await Future.delayed(Duration(seconds: 2));
  return "Offers loaded";
}

Future<void> main() async {
  var startSeq = DateTime.now();
  var restaurants = await getRestaurants();
  var categories = await getCategories();
  var offers = await getOffers();
  var endSeq = DateTime.now();
  print(restaurants);
  print(categories);
  print(offers);

  print("---------------------");
  print("Sequential Total Time: ${endSeq.difference(startSeq).inSeconds} seconds");
  print("---------------------");

  var startCon = DateTime.now();
  var results = await Future.wait([
    getRestaurants(),
    getCategories(),
    getOffers(),
  ]);
  var endCon = DateTime.now();
  for(var result in results){

  print("$result");
  }
  print("---------------------");
  print("Concurrent Total time: ${endCon.difference(startCon).inSeconds} seconds");
  print("---------------------");
}
