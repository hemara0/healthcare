import 'package:flutter/material.dart';
import 'package:healthcareit/components/listObject.dart';

import '../../components/catalogProducts.dart';

class MedicalHome extends StatefulWidget {
  @override
  State<MedicalHome> createState() => _MedicalHomeState();
}

class _MedicalHomeState extends State<MedicalHome> {
  @override
  Widget build(BuildContext context) {
    return CatalogProducts();
    // FutureBuilder<List>(
    //     future: getDeatils(),
    //     builder: (context, snap) {
    //       if ((snap.data == null)) {
    //         return const Center(child: CircularProgressIndicator());
    //       } else {
    //return buildmedicines(snap.data!);

    //         }
    //       });
  }

  Future<List> getDeatils() async {
    //var userPersonalinfo = await fetchUserData();
    List items = [
      {
        'name': 'item1',
        'manufacturing_company': 'comp1',
        'price': 50,
        'description': 'product discription'
      },
      {
        'name': 'item2',
        'manufacturing_company': 'comp2',
        'price': 20,
        'description': 'product discription'
      },
      {
        'name': 'item3',
        'manufacturing_company': 'comp3',
        'price': 100,
        'description': 'product discription'
      },
      {
        'name': 'item4',
        'manufacturing_company': 'comp4',
        'price': 60,
        'description': 'product discription'
      },
      {
        'name': 'item5',
        'manufacturing_company': 'comp5',
        'price': 30,
        'description': 'product discription'
      },
      {
        'name': 'item6',
        'manufacturing_company': 'comp6',
        'price': 50,
        'description': 'product discription'
      },
      {
        'name': 'item7',
        'manufacturing_company': 'comp7',
        'price': 70,
        'description': 'product discription'
      },
      {
        'name': 'item8',
        'manufacturing_company': 'comp8',
        'price': 45,
        'description': 'product discription'
      },
      {
        'name': 'item9',
        'manufacturing_company': 'comp9',
        'price': 90,
        'description': 'product discription'
      },
      {
        'name': 'item10',
        'manufacturing_company': 'comp1',
        'price': 70,
        'description': 'product discription'
      },
    ];
    return items;
  }
}
