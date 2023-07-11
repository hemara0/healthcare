import 'package:flutter/material.dart';
import 'package:healthcareit/components/catalogProducts.dart';

import 'cart.dart';

class ItemDetails extends StatefulWidget {
  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item details'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          //CatalogProducts(),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartEx()),
                );
              },
              child: Text('Go to cart'))
        ],
      )),
    );
  }
}
