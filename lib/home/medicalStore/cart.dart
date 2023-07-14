import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:healthcareit/controllers/cart_contoller.dart';
import 'package:healthcareit/model/product_model.dart';

import '../../components/listOnly.dart';
import '../../widgets/cart_products.dart';
import '../../widgets/cart_total.dart';

// class CartEx extends StatelessWidget {
//   const CartEx({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: ListView.builder(
//           itemCount: Product.products.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ProductCard(index: index);
//           }),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final cartContoller = Get.put(CartContoller());
//   final int index;
//   ProductCard({
//     Key? key,
//     required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 10,
//         ),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: 20,
//               //backgroundImage: Product.products[index].icon,
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Expanded(
//                 child: Text(
//               Product.products[index].name,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             )),
//             Expanded(child: Text('${Product.products[index].price}')),
//             IconButton(
//               onPressed: () {
//                 cartContoller.addProduct(Product.products[index]);
//               },
//               icon: Icon(Icons.add_circle),
//             ),
//           ],
//         ));
//   }
// }
class CartEx extends StatefulWidget {
  @override
  State<CartEx> createState() => _CartExState();
}

class _CartExState extends State<CartEx> {
  @override
  Widget build(BuildContext context) {
    //return Container(child: const Text("welcome to Cart"));
    //return Scaffold(
    //appBar: AppBar(title: Text('Your Cart')),
    //body:
    return Column(children: [
      Expanded(child: CartProducts()),
      Expanded(child: CartTotal())
    ]);
  }
}
