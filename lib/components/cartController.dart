import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareit/model/product.dart';

class CartController extends GetxController {
  final _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
      print('product added ${product.drugName}');
    } else {
      _products[product] = 1;
    }
    //SnackBar(content: Text("Product added ${product.drugName}"));
    // Get.snackbar(
    //     "Product Added",
    //     "You have added the ${product.name} to the cart",
    //     snackPosition: SnackPosition.BOTTOM,
    //     duration: Duration(seconds: 2));https://cloud.mongodb.com/v2/6443bfbeb2631e0f3852fb03#/dataAPI
  }

  get products => _products;

  get tax => 20.toString();

  get delivery => 50.toString();

  get productDetails =>
      _products.entries.map((product) => product.key.drugName).toList();

  get productsCount =>
      _products.entries.map((product) => product.value).toList();

  get cartTotal =>
      (double.parse(tax) + double.parse(delivery) + double.parse(total))
          .toString();

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get productSubtotal => _products.entries
      .map((product) => double.parse(product.key.drugPrice) * product.value)
      .toList();

  get total => _products.entries
      .map((product) => double.parse(product.key.drugPrice) * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
