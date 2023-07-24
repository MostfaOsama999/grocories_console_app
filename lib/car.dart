import 'dart:io';

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
    required this.width,
    required this.color,
  });

  void printCar(){
    print(engine);
    print(doors);
    print(color);
  }

}

void main() {
  print('please enter car engine');
  String engine = stdin.readLineSync() ?? 'unknown';
  print('please enter car color');
  String color = stdin.readLineSync() ?? 'unknown';
  print('please enter car width');
  String width = stdin.readLineSync() ?? 'unknown';
  print('please enter car height');
  String height = stdin.readLineSync() ?? 'unknown';

  Car myCar =
      Car(engine: engine, height: double.tryParse(height) ?? 2, width: double.tryParse(width) ?? 2, color: color);

  myCar.printCar();

 String myEngine =  myCar.engine;


}
