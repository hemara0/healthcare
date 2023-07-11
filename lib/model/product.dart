class Product {
  final String name;
  final double price;

  const Product({required this.name, required this.price});

  static const List<Product> products = [
    Product(name: 'Apple', price: 100),
    Product(name: 'Organge', price: 50),
    Product(name: 'Pear', price: 70),
  ];
}
