import 'dart:html';
import 'dart:io';

class Product {
  final int id;
  final String name;
  final String category;
  late int stock;
  final double price;
  final String color;
  final String size;
  void decremeantStock(int theQuantity) {

  this.stock-=theQuantity ;

    }

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.stock,
    required this.price,
    required this.color,
    required this.size,
    
  });

  void printProduct({bool showQuantity = false}) {
    print(" ------- id: $id ------- ");
    print('\tName: $name');
    if (showQuantity) {
      print('\tQuantity: $stock');
    } else {
      print('\tStock: $stock');
    }
    print('\tPrice: $price EGP');
    print('\tCategory: $category');
    if (size.isNotEmpty) {
      print('\tSize: $size');
    }
    if (color.isNotEmpty) {
      print('\tColor: $color');
    }
    print('');
  }
}

class Store {
  final List<Product> products = [];

  int defaultId() => DateTime.now().millisecondsSinceEpoch;

  void addProduct() {
    const defaultQuantity = 1;

    print('please enter product name');
    final name = stdin.readLineSync() ?? 'unknown';

    print('please enter id');
    final input = stdin.readLineSync() ?? 'unknown';
    final id = int.tryParse(input) ?? defaultId();

    print('please enter category');
    final category = stdin.readLineSync() ?? 'unknown';

    print('please enter stock quantity');
    final stock = int.tryParse(stdin.readLineSync() ?? 'unknown') ?? defaultQuantity;

    double price = 0;
    while (price == 0) {
      print('please enter price');
      final input = stdin.readLineSync();
      if (input != null) {
        price = double.tryParse(input) ?? 0;
      }
    }

    print('please enter color');
    final color = stdin.readLineSync() ?? '';

    print('please enter size');
    final size = stdin.readLineSync() ?? '';

    final product = Product(
      id: id,
      name: name,
      category: category,
      stock: stock,
      price: price,
      color: color,
      size: size,
    );

    products.add(product);
  }

  void createOrder() {
    if (products.isEmpty) {
      print('no items available :(');
      return;
    }

    print('available in store');
    for (final product in products) {
      product.printProduct();
    }

    print('enter product id to select item');
    final input = stdin.readLineSync() ?? '';
    final selectedId = int.tryParse(input);

    final selectedProduct = products.firstWhere(
      (product) => product.id == selectedId,
      orElse: () => Product(
        id: -1,
        name: '',
        category: '',
        stock: 0,
        price: 0,
        color: '',
        size: '',
      ),
    );

    if (selectedProduct.id == -1) {
      print('no product available with the given id');
      return;
    }

    print('how many items do you want ? \tplease enter the quantity');
    final quantityInput = stdin.readLineSync() ?? '';
    final quantity = int.tryParse(quantityInput) ?? 0;

    if (quantity <= 0 || quantity > selectedProduct.stock) {
      print('please enter a valid quantity');
      print('the available quantity is: ${selectedProduct.stock}');
      return;
    }
    else{
      selectedProduct.decremeantStock(quantity);
    }

    selectedProduct.printProduct(showQuantity: true);
    final total = quantity * selectedProduct.price;
    print('\t Total price: $total EGP');
    print("press 'c' to confirm");
    final confirmInput = stdin.readLineSync() ?? '';
    if (confirmInput == 'c' || confirmInput == 'C') {
      selectedProduct.stock -= quantity;
    }
  }

  void startProgram() {
    print("press 'e' to add a new product or 'o' to create an order");

    final input = stdin.readLineSync() ?? '';

    if (input == 'e' || input == 'E') {
      addProduct();
    } else if (input == 'o' || input == 'O') {
      createOrder();
    } else {
      print('Invalid input');
    }
  }
}

void main() {
  final store = Store();
  while (true) {
    store.startProgram();
  }
}