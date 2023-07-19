import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareit/components/cartController.dart';

import 'cartProducts.dart';

class CartEx extends StatefulWidget {
  @override
  State<CartEx> createState() => _CartExState();
}

class _CartExState extends State<CartEx> {
  @override
  Widget build(BuildContext context) {
    //return Scaffold(
    //appBar: AppBar(title: Text('Your Cart')),
    //body:
    return Column(children: [
      Expanded(child: CartProducts()),
      Expanded(child: CartTotal())
    ]);
  }
}

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('${controller.total}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tax',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${controller.tax.toString()}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${controller.delivery}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${controller.cartTotal}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  print(controller.productDetails);
                  print(controller.productsCount);
                  // print(contoller.products[0].price);
                },
                child: Text('Proceed to Pay')),
          ],
        ),
      ),
    );
  }
}
