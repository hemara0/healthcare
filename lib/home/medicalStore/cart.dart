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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              'Total',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
            Expanded(
                child: Text('${controller.total}',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
