import 'dart:io';

import 'orders.dart';
import 'product.dart';

void main() {
  Map<int, Product> products = {};
  print('please enter a character ');
  print('for adding enter a\nfor ordring enter o');
  print('if u want to increase quantity press q');
  var input = stdin.readLineSync() ?? '';
  input.toLowerCase();

  while (input != '') {
    if (input == 'a') {
      print('the available products is:');
      print(products);
      addProduct(products);
      print(products);
    } else if (input == 'o') {
      print(products);
      getOrder(products);
    } else if (input == 'q') {
      print(products);
      increment(products);
    } else {
      print('please enter valid charcter');
      break;
    }
    print('please enter a character ');
    print('for adding enter a\nfor ordering enter o');
    print('if u want to increase quantity press q');
    input = stdin.readLineSync() ?? '';
  }
}

void addProduct(Map<int, Product> products) {
  print('name:');
  var name = stdin.readLineSync() ?? '';
  print('id:');
  var id = int.parse(stdin.readLineSync()!);
  print('quantity:');
  var quantity = int.tryParse(stdin.readLineSync() ?? '0');
  print('price:');
  var price = double.tryParse(stdin.readLineSync() ?? '0.0');
  print('category:');
  var category = stdin.readLineSync() ?? '';
  print('size:');
  var size = stdin.readLineSync() ?? '';
  print('color:');
  var color = stdin.readLineSync() ?? '';

  var product = Product(
      name: name,
      id: id,
      quantity: quantity,
      price: price,
      category: category,
      size: size,
      color: color);

  products[id] = product;
}

void getOrder(Map<int, Product> products) {
  print('available products:$products');

  print('enter product id');
  int idOfProduct = int.parse(stdin.readLineSync()!);

  // view the available quantity for the user
  int? availableQuantity = products[idOfProduct]!.quantity;

  print('available quantity:$availableQuantity');

  print('enter the quantity');
  int quantityOfProduct = int.parse(stdin.readLineSync()!);

  if (quantityOfProduct >= availableQuantity!) {
    print('please enter a valid quantity');
    return;
  }

  if (!products.containsKey(idOfProduct)) {
    print('please enter a valid product id');
    return;
  }

  double productPrice = products[idOfProduct]!.price!;

  double totalPrice = products[idOfProduct]!.price! * quantityOfProduct;

  //to save the orders
  var order =
  Orders(orders: products, time: DateTime.now(), totalPrice: totalPrice);

  print('please enter c to confirm \nenter any key to cancel');
  String userInput = stdin.readLineSync() ?? '';

  if (userInput == 'c') {
    print('order added to ur card');
    print(order.time);
    print('product price is:$productPrice');
    print('total price is: $totalPrice');

    //the decrement of the available quantity
    products[idOfProduct]!.quantity! - quantityOfProduct;
  } else {
    print('the order has been canceled');
  }
}

void increment(Map<int, Product> products) {
  print('please enter id of product');
  print(products);
  int? idOfProduct = int.tryParse(stdin.readLineSync() ?? '0');
  print('please enter a new quantity');
  int? newQuantity = int.tryParse(stdin.readLineSync() ?? '0');

  products[idOfProduct]!.quantity = newQuantity!;
}

