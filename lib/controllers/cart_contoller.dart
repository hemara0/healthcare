import 'package:get/get.dart';
import 'package:healthcareit/model/product_model.dart';

import '../model/product_model.dart';

class CartContoller extends GetxController {
  //adding a dict to store the products in the cart
  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    Get.snackbar(
      "Products Added",
      "You have added the ${product.name} to the cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;

  get productDetails =>
      _products.entries.map((product) => product.key.name).toList();

  get productsCount =>
      _products.entries.map((product) => product.value).toList();

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  get delivery => 100;

  get tax => 30;

  get cartTotal => (delivery +
          tax +
          _products.entries
              .map((product) => product.key.price * product.value)
              .toList()
              .reduce((value, element) => value + element))
      .toString();
}
