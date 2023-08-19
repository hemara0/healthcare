import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareit/components/cartController.dart';
import 'package:healthcareit/model/product.dart';
import '../home/medicalStore/itemDetails.dart';
import '../provider/provider.dart';

class CatalogProducts extends StatefulWidget {
  const CatalogProducts({Key? key}) : super(key: key);

  @override
  State<CatalogProducts> createState() => _CatalogProductsState();
}

class _CatalogProductsState extends State<CatalogProducts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: fetchPharmacyData(),
        builder: (context, snap) {
          if ((snap.data == null)) {
            //print(snap.data!);
            return const Center(child: CircularProgressIndicator());
          } else {
            print(snap.data!);
            return Flexible(
              child: ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CatalogProductCard(
                        index: index, products: snap.data!);
                  }),
            );
          }
        });
  }
}

class CatalogProductCard extends StatefulWidget {
  final int index;
  final List<Product> products;
  //final CartController controller = Get.find();
  final cartController = Get.put(CartController());
  CatalogProductCard({
    Key? key,
    required this.index,
    required this.products,
  }) : super(key: key);

  @override
  State<CatalogProductCard> createState() => _CatalogProductCardState();
}

class _CatalogProductCardState extends State<CatalogProductCard> {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemDetails(
                      productDetails: widget.products[widget.index],
                    )),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CircleAvatar(
              radius: 20,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(child: Text(widget.products[widget.index].drugName)),
            Expanded(child: Text('${widget.products[widget.index].drugPrice}')),
            IconButton(
                onPressed: () {
                  cartController.addProduct(widget.products[widget.index]);
                },
                icon: Icon(Icons.add_circle))
          ]),
        ));
  }
}
