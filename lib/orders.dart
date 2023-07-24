import 'product.dart';

class Orders {
  Map<int, Product> orders = {};
  double? totalPrice;
  DateTime? time;

  Orders({required this.orders, required this.time, required this.totalPrice});
}