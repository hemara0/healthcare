import 'package:flutter/material.dart';

class Product {
  final String name;
  final price;
  final icon;

  const Product({required this.name, required this.price, required this.icon});

  static const List<Product> products = [
    Product(name: 'item1', price: 100, icon: Icon(Icons.hourglass_bottom)),
    Product(name: 'item2', price: 50, icon: Icon(Icons.hourglass_bottom)),
    Product(name: 'item1', price: 200, icon: Icon(Icons.hourglass_bottom)),
  ];
}
