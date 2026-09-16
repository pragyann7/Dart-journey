enum OrderStatus { placed, preparing, ready, delivered }

Stream<OrderStatus> trackOrder() async* {
    await Future.delayed(Duration(seconds: 1));
    yield OrderStatus.placed;

    await Future.delayed(Duration(seconds: 1));
    yield OrderStatus.preparing;

    await Future.delayed(Duration(seconds: 1));
    yield OrderStatus.ready;

    await Future.delayed(Duration(seconds: 1));
    yield OrderStatus.delivered;
}

Future<void> main() async{
  await for(var status in trackOrder()){
    switch (status) {
      case OrderStatus.placed:
        print("Order status: placed");
        break;
      case OrderStatus.preparing:
        print("Order status: preparing");
        break;
      case OrderStatus.ready:
        print("Order status: ready");
        break;
      case OrderStatus.delivered:
        print("Order status: delivered");
        break;
    }
  }
}