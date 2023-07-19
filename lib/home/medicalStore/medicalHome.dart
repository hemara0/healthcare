import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/cart_contoller.dart';
import '../../model/product_model.dart';
import 'itemDetails.dart';

class MedicalHome extends StatefulWidget {
  @override
  State<MedicalHome> createState() => _MedicalHomeState();
}

class _MedicalHomeState extends State<MedicalHome> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          itemCount: Product.products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(index: index);
          }),
    );
  }
}

class ProductCard extends StatelessWidget {
  final cartContoller = Get.put(CartContoller());
  final int index;
  ProductCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ItemDetails(
                    // productDescription: 'Product Description',
                    // productName: Product.products[index].name,
                    // productPrice: '${Product.products[index].price}',
                    productDetails: Product.products[index],
                  )),
        );
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                //backgroundImage: Product.products[index].icon,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                Product.products[index].name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
              Expanded(child: Text('${Product.products[index].price}')),
              IconButton(
                onPressed: () {
                  cartContoller.addProduct(Product.products[index]);
                },
                icon: Icon(Icons.add_circle),
              ),
            ],
          )),
    );
  }
}
