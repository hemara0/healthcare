import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareit/components/cartController.dart';

import '../../model/user.dart';
import '../../provider/provider.dart';
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

class CartTotal extends StatefulWidget {
  CartTotal({super.key});

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: fetchUserData(),
        builder: (context, snap) {
          if ((snap.data == null)) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Obx(() => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 75),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text('${controller.total}',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold))
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
                          onPressed: () async {
                            UserMedicalStore sendData = UserMedicalStore(
                                subtotal: controller.total.toString(),
                                tax: controller.tax.toString(),
                                delivery: controller.delivery.toString(),
                                total: controller.cartTotal.toString(),
                                orderDate: DateTime.now().toString(),
                                drugs: [],
                                id: '');
                            for (int i = 0;
                                i < controller.productDetails.length;
                                i++) {
                              DrugsOrders drugDetails = DrugsOrders(
                                  drugID:
                                      controller.productDetails[i].toString(),
                                  drugCount:
                                      controller.productsCount[i].toString());
                              sendData.drugs.add(drugDetails);
                            }
                            //print(sendData);
                            User userData = snap.data!;
                            userData.userOrders.medicine.add(sendData);
                            await updateData(userData);
                          },
                          child: Text('Proceed to Pay')),
                    ],
                  ),
                ));
          }
        });
  }
}
