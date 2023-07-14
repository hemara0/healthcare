import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareit/components/cartController.dart';
import 'package:healthcareit/home/medicalStore/itemDetails.dart';
import 'package:healthcareit/model/product.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext contect, int index) {
              return CartProductCard(
                controller: controller,
                index: index,
                product: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
              );
            }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  const CartProductCard(
      {Key? key,
      required this.controller,
      required this.index,
      required this.product,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            // backgroundColor: Colors.white,
            // child: IconButton(
            //     icon: Icon(Icons.photo),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => ItemDetails()),
            //       );
            //     }),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(child: Text(product.drugName)),
          Expanded(child: Text('${product.drugPrice}')),
          IconButton(
              onPressed: () {
                controller.removeProduct(product);
              },
              icon: Icon(Icons.remove_circle)),
          Text('${quantity}'),
          IconButton(
              onPressed: () {
                controller.addProduct(product);
              },
              icon: Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}
