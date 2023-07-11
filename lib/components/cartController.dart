import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareit/model/product.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
      print('product added ${product.name}');
    } else {
      _products[product] = 1;
    }
    // Get.snackbar(
    //     "Product Added",
    //     "You have added the ${product.name} to the cart",
    //     snackPosition: SnackPosition.BOTTOM,
    //     duration: Duration(seconds: 2));
  }

  get products => _products;

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
