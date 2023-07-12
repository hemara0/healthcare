import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:healthcareit/controllers/cart_contoller.dart';

import '../model/product_model.dart';

class CartProducts extends StatelessWidget {
  final CartContoller contoller = Get.find();
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
            itemCount: contoller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductCard(
                contoller: contoller,
                product: contoller.products.keys.toList()[index],
                quantity: contoller.products.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartContoller contoller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard(
      {Key? key,
      required this.contoller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 40,
              //backgroundImage: product.icon,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(child: Text(product.name)),
            Expanded(child: Text(product.price.toString())),
            IconButton(
                onPressed: () {
                  contoller.removeProduct(product);
                },
                icon: Icon(Icons.remove_circle)),
            Text('${quantity}'),
            IconButton(
                onPressed: () {
                  contoller.addProduct(product);
                },
                icon: Icon(Icons.add_circle)),
          ],
        ));
  }
}
