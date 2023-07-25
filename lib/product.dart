import 'dart:core';
import 'dart:io';

class Product{
  String? name, category, color;
  int? id , quantity;
  double? price, size;
  String? input;
  List<Product> store=[];


  Product({
    required this.name,
    required this.category,
    required this.id,
    required this.price,
    required this.quantity,
    this.size,
    this.color
});


  // void set getName(String input){
  //   this.name= input;
  // }
  // String get getName {
  //   return name ?? '';
  // }
  // //////////////
  // void set getCategory(String category){
  //   this.category= category;
  // }
  // String get getCategory {
  //   return category ?? '';
  // }
  // ///////////////
  // void set getColor(String color){
  //   this.color= color;
  // }
  // String get getColor {
  //   return color ?? '';
  // }
  // ///////////
  // void set getID(int id ){
  //   this.id= id;
  // }
  // int get getID {
  //   return id ?? 0;
  // }
  // //////////////////////
  // void set getQuantity(int quantity){
  //   this.quantity= quantity;
  // }
  // int get getQuantity {
  //   return quantity ?? 0;
  // }
  // /////////////////////
  // void set getPrice(double price){
  //   this.price= price;
  // }
  // double get getPrice {
  //   return price ?? 0;
  // }
  /////////////////////////////////////////////////////
  void getInput(){
    print('Please Enter name of your product');
    name= stdin.readLineSync() ?? '';

    print('Please Enter category of your product');
    category= stdin.readLineSync() ?? '';

    print('Please enter id of your product');
    id = int.parse(stdin.readLineSync() ?? '0');

    print('Please enter quantity of your product');
    quantity = int.parse(stdin.readLineSync() ?? '0');

    print('Please enter price of your product');
    price = double.parse(stdin.readLineSync() ?? '0');

    String? check;
    print('Do you want to add size of product (yes/no)?');
    check= stdin.readLineSync();
    if(check=='yes' || check=='Yes'){
      print('Please enter size of your product');
      size = double.parse(stdin.readLineSync() ?? '0');
    }

    print('Do you want to add color of product (yes/no)?');
    check= stdin.readLineSync();
    if(check=='yes' || check=='Yes'){
      print('Please enter color of your product');
      color = stdin.readLineSync() ?? 'empty';
    }
    // storeList.add(smallList);
    // return storeList;

  }


  void printList(){
      print('Name: ${name}');
      print('ID: ${id}');
      print('Category: ${category}');
      print('Price: ${price}');
      print('Stock: ${quantity}');
      print('----------------------------------------------------');


  }

  void loopProgram(input){

    if(input == 'a' || input == 'A') {
      getInput();
      printList();

    //   print('Enter a to add New product or \'o\' to make order');
    //   input = stdin.readLineSync() ?? '';
    //   return true;
    // }
    // else{
    //   return false;
    }
  }
}



void main(){

  List<Product> store=[];

  String? name, category, color;
  int? id , quantity;
  double? price, size;
  bool value = true;

  String input;
  print('Enter a to add New product or \'o\' to make order');
  input = stdin.readLineSync() ?? '';
  while(value){
    if(input == 'a' || input == 'A') {
    Product product= Product(name: name, category: category, id: id, price: price, quantity: quantity,size: size,color: color);

      // value = product.loopProgram(input);
    product.loopProgram(input);
      store.add(product);
    }
    ///////////////////////

    if(store.isEmpty){
      print('You don\'t have available products');
    }
    if(input == 'o' || input == 'O') {
        print('Your products are: ');
        for(int i=0; i<store.length; i ++){
          store[i].printList();
        }
        print('enter product id to select item');
        int selectedId;


        selectedId = int.parse(stdin.readLineSync() ?? '');

        for(int i =0; i< store.length; i++){
          if(selectedId == store[i].id){
            store[i].printList();
            print('Enter quantity you want:');
            int? orderQuantity = int.parse(stdin.readLineSync() ?? 'You must enter a quantity');
            int? storeQuantity = store[i].quantity;
            if( orderQuantity <= storeQuantity!){
              print('Item price is ${store[i].price}');
              print('Your total price is ${store[i].price! * orderQuantity} ');
              print('Please enter \'c\' to confirm your order');
              String confirm = stdin.readLineSync() ?? 'empty confirmation';
              if(confirm == 'c' || confirm == 'C'){
                store[i].quantity = (store[i].quantity! -orderQuantity)!;
                print('Order Confirmed :)');
              }
            }
            else{
              print('Quantity is not available!');
            }
          }
        }
      }
    print('Enter a to add New product or \'o\' to make order');
    input = stdin.readLineSync() ?? '';
    if(input == 'a' || input == 'A' || input == 'o' || input == 'O'){
      value = true;

    }
    else{
      value= false;
    }

  }

  // print('***************************************');
  // for(int i=0; i<store.length; i ++){
  //   store[i].printList();
  // }


  // Product product= Product(name: name, category: category, id: id, price: price, quantity: quantity,size: size,color: color);
  // bool value = true;
  // while(value){
  //   value = product.loopProgram();
  //   store.add(product);
  //   print(store);
  // }

}