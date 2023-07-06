import 'package:flutter/material.dart';

import '../../components/listOnly.dart';

class CartEx extends StatefulWidget {
  @override
  State<CartEx> createState() => _CartExState();
}

class _CartExState extends State<CartEx> {
  var _item = {
    'name': 'item1',
    'price': 50,
    'icon': Icon(Icons.hourglass_empty),
    'count': 2
  };

  void _incrementCounter() {
    setState(() {
      //_item['count'] = (_item['count'])as int +1;
      if (_item['count'] != null) {
        _item['count'] = (_item['count'] + 1)!;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _item['count']--;
      if (_item['count'] <= 0) {
        _item['count'] = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: getDeatils(),
        builder: (context, snap) {
          if ((snap.data == null)) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(children: [
              const SizedBox(
                height: 50, // Set the desired height
              ),
              Expanded(
                  child: Container(
                child: ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index) {
                    final item = snap.data![index];

                    print(item);
                    return Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                onTap: () {},
                                leading: item['icon'],
                                title: Text(item['name']),
                                subtitle: Text(item['price'].toString()),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                      onPressed: _incrementCounter,
                                      child: Icon(Icons.add)),
                                  Text(
                                    _item['count'].toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                  ElevatedButton(
                                      onPressed: _decrementCounter,
                                      child: Icon(Icons.remove)),
                                ],
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              )),
              const SizedBox(
                height: 50, // Set the desired height
              ),
              Expanded(child: Container(child: buildCartTotal(snap.data!))),
            ]);
          }
        });
  }

  Future<List> getDeatils() async {
    // var userPersonalinfo = await fetchUserData();
    // List appDetails = userPersonalinfo.userOrders.appointment;
    List items = [
      {
        'name': 'item1',
        'price': 50,
        'icon': Icon(Icons.hourglass_empty),
        'count': 2
      },
      {
        'name': 'item2',
        'price': 100,
        'icon': Icon(Icons.hourglass_empty),
        'count': 3
      }
    ];
    return items;
  }
}
