// import 'package:flutter/material.dart';
// import 'package:healthcareit/components/catalogProducts.dart';

// import 'cart.dart';

// class ItemDetails extends StatefulWidget {
//   @override
//   State<ItemDetails> createState() => _ItemDetailsState();
// }

// class _ItemDetailsState extends State<ItemDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Item details'),
//       ),
//       body: SafeArea(
//           child: Column(
//         children: [
//           //CatalogProducts(),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CartEx()),
//                 );
//               },
//               child: Text('Go to cart'))
//         ],
//       )),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../components/cartController.dart';
import '../../model/product.dart';
import '../medicalStore.dart';
import 'cart.dart';

class ItemDetails extends StatefulWidget {
  // final String productName;
  // final String productDescription;
  // final String productPrice;
  Product productDetails;

  ItemDetails({
    // required this.productName,
    // required this.productDescription,
    // required this.productPrice,
    required this.productDetails,
  });
  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  final cartContoller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // const Card(
          //   child: Padding(padding: EdgeInsets.all(24.0),
          //   child: Text(widget.productName),)
          // ),
          Card(
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                widget.productDetails.drugName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Card(
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                widget.productDetails.drugPrice.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              cartContoller.addProduct(widget.productDetails);
            },
            child: Text('Add to Cart'),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(200, 50),
              padding: EdgeInsets.only(top: 5),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Cart'),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          MedicalStore()));
                            },
                            icon: Icon(Icons.close))
                      ],
                    ),
                    body: Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: CartEx(),
                    ),
                  );
                },
              ));
            },
            child: Text('Buy Now'),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(200, 50),
              padding: EdgeInsets.only(top: 5),
            ),
          ),
          Card(
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Card(
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                'Product Description',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
