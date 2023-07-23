import 'dart:io';

import 'product.dart';


/// timestamp is an integer refers to the current date and time in milliseconds
int defaultId() => DateTime.now().millisecondsSinceEpoch;

/// take product.dart from user
Product getProduct() {
  const defaultQuantity = 1;

  void check(dynamic value, String name) {
    while(value==''||value==null)
    {
      print('value cant be empty');
      if(name=='quantity'||name=='price'||name=='pick') {
        print('the value her cant be String');
        value = int.tryParse(stdin.readLineSync()!);
      }else{
        value = stdin.readLineSync();
      }
    }
  }


  print('please enter product.dart name');
  String? name = stdin.readLineSync() ?? '';
  check(name, 'name');
  print('please enter id');
  int  id = int.tryParse(stdin.readLineSync()!)?? defaultId() ;


  print('please enter category');
  String? category  = stdin.readLineSync() ?? '';
  check(category, 'category');


  print('please enter stock quantity');
  int stock = int.tryParse(stdin.readLineSync() !)??1 ;



    print('please enter price');
    double price = double.tryParse(stdin.readLineSync()!)??0;
    check(price, 'price');




  print('please enter color');
  String? color = stdin.readLineSync() ?? '';

  print('please enter size');
 String? size = stdin.readLineSync() ?? '';




  return Product(id: id ,named: name, quantity: stock, price: price, size: size, category: category, color: color);
}

class Order{
  List<Product> products=[];

void addProduct(Product product)
{
  products.add(product);
}

void makeOrder(){
  if(products.isEmpty){
    print("no products available");
  }
  else{
    print('the available products');
for(Product product in products)
  {
    print(product.id);
    print(product.named);
    print(product.size);
    print(product.quantity);
    print(product.category);
    print(product.price);
    print('_____________');
  }
print('select an item with the id');
int? input=int.tryParse(stdin.readLineSync()!);

print('choose the quantity do you need');
int? quantity=int.tryParse(stdin.readLineSync()?? '1');

print('press c to confirm');
String? conn=stdin.readLineSync()??'unknown';
if(conn=='c')
  {
    print("confirmed");
  }

  }

}
}

bool? startProgram(Order order) {
  print("press 'e' to add a new product.dart or 'o' to create an order");

  String input = stdin.readLineSync() ?? '';

  if (input == 'e' || input == 'E') {
    Product newProduct=getProduct();
    order.addProduct(newProduct);
  } else if (input == 'o' || input == 'O') {
   order.makeOrder();
  } else {
    return false;
  }
  return null;
}

void main() {
  Order order=Order();
  bool value = true;
  while (value) {
    value = startProgram(order) ?? true;
  }
}
