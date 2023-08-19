import 'package:flutter/material.dart';

import '../model/user.dart';
import '../provider/provider.dart';

class MyOrders extends StatefulWidget {
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: fetchUserData(),
        builder: (context, snap) {
          if ((snap.data == null)) {
            //print(snap.data!);
            return const Center(child: CircularProgressIndicator());
          } else {
            print(snap.data!);
            return ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: 5000), // **THIS is the important part**
                child: ListView.builder(
                    itemCount: snap.data!.userOrders.medicine.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 5.0),
                          borderRadius: BorderRadius.circular(10),
                          //color: Colors.blue,
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: BuildOrders(
                            index: index,
                            orders: snap.data!.userOrders.medicine[index]),
                      );
                    }));
            //),
            //);
          }
        });
  }
}

class BuildOrders extends StatefulWidget {
  final int index;
  final UserMedicalStore orders;
  BuildOrders({
    Key? key,
    required this.index,
    required this.orders,
  }) : super(key: key);
  @override
  State<BuildOrders> createState() => _BuildOrdersState();
}

class _BuildOrdersState extends State<BuildOrders> {
  @override
  Widget build(BuildContext context) {
    List drugNames = [];
    for (var element in widget.orders.drugs) {
      drugNames.add(element.drugID);
    }
    return InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => ItemDetails(
          //             productDetails: widget.products[widget.index],
          //           )),
          // );
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Order ID: ${widget.orders.id}",
                  )),
                  Expanded(
                      child: Text(
                          "Date: ${widget.orders.orderDate.substring(0, 10)}")),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: drugNames.length,
                  itemBuilder: (context, ind) {
                    return Card(
                        //color: Colors.blue,
                        //elevation: 2,
                        //margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                      onTap: () {
                        // setState(() {
                        //   _isEnabled = !_isEnabled;
                        // });
                      },
                      title: Text(drugNames[ind]),
                    ));
                  }),
            ]));
  }
}
