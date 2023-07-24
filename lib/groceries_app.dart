import 'dart:io';

List<Map<String, dynamic>> products = [];

/// current date timestamp
///
/// timestamp is an integer refers to the current date and time in milliseconds
int defaultId() => DateTime.now().millisecondsSinceEpoch;

/// take product from user
void getProduct() {
  const defaultQuantity = 1;

  Map<String, dynamic> product = {};

  // holds the input data temporarily
  String? input;
  print('please enter product name');
  product['name'] = stdin.readLineSync() ?? 'unknown';

  print('please enter id');
  input = stdin.readLineSync() ?? 'unknown';
  // try to parse the given id to string, if it's null, get the default id
  product['id'] = int.tryParse(input) ?? defaultId();

  print('please enter category');
  input = stdin.readLineSync() ?? 'unknown';
  product['category'] = input;

  print('please enter stock quantity');
  input = stdin.readLineSync() ?? 'unknown';
  // try to parse the given input to int, if it's null, set the default quantity
  product['stock'] = int.tryParse(input) ?? defaultQuantity;

  // important to reset the input
  input = null;

  // takes input from the user until it's a valid double value
  while (double.tryParse(input ?? '') == null) {
    print('please enter price');
    input = stdin.readLineSync();
  }

  // save the value to the product
  product['price'] = double.parse(input!);

  print('please enter color');
  product['color'] = stdin.readLineSync() ?? '';

  print('please enter size');
  product['size'] = stdin.readLineSync() ?? '';

  // add the product to the list
  products.add(product);
}

/// print the given product, and it prints the product stock by default
/// unless you set [showQuantity] true, it shows the quantity rather than stock
void printProduct(Map<String, dynamic> product, {bool showQuantity = false}) {
  print(" ------- id: ${product['id']} ------- ");
  print('\tName: ${product['name']}');
  if (showQuantity) {
    print('\tQuantity: ${product['quantity']}');
  } else {
    print('\tStock: ${product['stock']}');
  }
  print('\tPrice: ${product['price']} EGP');
  print('\tCategory: ${product['category']}');
  if (product['size'] != '') {
    print('\tSize: ${product['size']}');
  }
  if (product['color'] != '') {
    print('\tColor: ${product['color']}');
  }
  print('');
}

void createOrder() {
  if (products.isEmpty) {
    print('no items available :(');
    // this return statement ends the function here
    return;
  }

  print('available in store');
  // prints all products we have
  for (Map<String, dynamic> product in products) {
    printProduct(product);
  }

  String input;
  Map<String, dynamic> selectedProduct = {};

  print('enter product id to select item');
  input = stdin.readLineSync() ?? '';
  var selectedId = int.tryParse(input); // 5

  if (selectedId != null) {
    // get first product in our products list WHERE the product id is equal to the selected id
    selectedProduct = products.firstWhere(
      //  function returns bool value of which item you want
      (product) => product['ID'] == selectedId,
      // this function runs when no product/element available in the list
      // if orElse is omitted, it throws an error
      orElse: () => {},
    );
  }

  // if we don't find the product end the function
  if (selectedProduct.isEmpty) {
    print('no product available with the given id');
    return;
  }

  //-- we have the selected product, now it's time to get the quantity
  print('how many items do you want ? \tplease enter the quantity');
  input = stdin.readLineSync() ?? '';

  // make sure the input is a valid quantity
  // input must be int, and must be less than stock quantity
  while (int.tryParse(input) == null || int.parse(input) > selectedProduct['stock']) {
    print('please enter a valid quantity');
    print('the available quantity is: ${selectedProduct['stock']}');
    input = stdin.readLineSync() ?? '';
  }

  // set the required quantity to the product, it will be user by the printProduct function
  selectedProduct['quantity'] = int.parse(input);

  // now we have a valid order, let's confirm with the user
  print('your order is:');
  printProduct(selectedProduct, showQuantity: true);
  var total = selectedProduct['quantity'] * selectedProduct['price'];
  print('\t Total price: $total EGP');
  print('press \'c\' to confirm');
  input = stdin.readLineSync() ?? '';
  if (input == 'c' || input == 'C') {
    products.firstWhere((element) => element['id'] == selectedId)['stock'] -= selectedProduct['quantity'];
  }
}

bool? startProgram() {
  print("press 'e' to add a new product or 'o' to create an order");

  String input = stdin.readLineSync() ?? '';

  if (input == 'e' || input == 'E') {
    getProduct();
  } else if (input == 'o' || input == 'O') {
    createOrder();
  } else {
    return false;
  }
  return null;
}

void main() {
  bool value = true;
  while (value) {
    value = startProgram() ?? true;
  }



}

String? engine;

class Car {
 String engine;
 int doors;
 double height;
 double width;
 String color;

  Car({
    required this.engine,
    this.doors = 4,
    required this.height,
    required this. width,
    required this. color,
  });
}


