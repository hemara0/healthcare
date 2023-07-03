import 'package:flutter/material.dart';
import 'package:healthcareit/home/medicalStore/cart.dart';

import '../pages/settingsPage.dart';
import 'medicalStore/medicalHome.dart';
import 'medicalStore/medicalSearch.dart';

class MedicalStore extends StatefulWidget {
  @override
  State<MedicalStore> createState() => _MedicalStoreState();
}

class _MedicalStoreState extends State<MedicalStore> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medical Store'), actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.add_shopping_cart_outlined),
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
            }),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close))
      ]),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings_outlined),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: MedicalHome(),
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: MedicalSearch(),
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Settings(),
        ),
      ][currentPageIndex],
    );
  }
}
