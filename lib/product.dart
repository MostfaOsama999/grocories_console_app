class Product {
  String? name;
  int? id;
  int? quantity;
  double? price;
  String? category;
  String? size;
  String? color;

  Product({required this.name,
    required this.id,
    required this.quantity,
    required this.price,
    required this.category,
    this.size,
    this.color}) {
    print('this product is $name');
    print('id of this product is $id');
    print('left $quantity ');
    print('price $price');
    print('category $category');
    print('this product is $name');
  }
}