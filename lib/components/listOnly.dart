import 'dart:js';

import 'package:flutter/material.dart';
import 'package:healthcareit/settings/faq.dart';
import 'package:healthcareit/settings/myCards.dart';
import 'package:healthcareit/settings/orders.dart';
import 'package:healthcareit/settings/payments.dart';
import 'package:healthcareit/settings/personalInfo.dart';
import 'package:healthcareit/settings/storageData.dart';

import '../model/user.dart';
import '../pages/visitsPage.dart';
import '../settings/account.dart';

Widget buildAppointment(Appointment appointmentFields, List fieldIcons) {
  List appointmentList = [];
  appointmentList.add(appointmentFields.hospitalId);
  appointmentList.add(appointmentFields.doctorId);
  appointmentList.add(appointmentFields.visitDate);
  appointmentList.add(appointmentFields.visitTime);
  appointmentList.add(appointmentFields.reasonOfVisit);
  appointmentList.add(appointmentFields.bookingDate);
  return Column(children: [
    Expanded(
        child: ListView.builder(
            itemCount: appointmentList.length,
            itemBuilder: (context, index) {
              return Card(
                  color: Colors.blue,
                  //elevation: 4,
                  //margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    onTap: () {
                      // setState(() {
                      //   _isEnabled = !_isEnabled;
                      // });
                    },
                    leading: Icon(fieldIcons[index]),
                    title: Text(appointmentList[index]),
                  ));
            }))
  ]);
}

Widget buildlist(List users, User userPersonalInfo) => ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          color: Colors.blue,
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            onTap: () async {
              // await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) =>
              //           getPage(users[index], userPersonalInfo)),
              // );
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(users[index]),
                  ),
                  body: Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: getPage(users[index], userPersonalInfo)),
                );
              }));
            },
            //   ));
            // },
            // leading: Text(
            //   users[index]["_id"].toString(),
            //   style:
            //       const TextStyle(fontSize: 24, color: Colors.white),
            // ),
            title: Text(
              users[index],
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            // subtitle: Text(
            //   users[index],
            //   style: const TextStyle(fontSize: 14, color: Colors.white),
            // ),
          ),
        );
      },
    );
getSubtotal(List items) {
  int? sub = 0;
  for (var item in items) {
    sub = (sub! + (item['price'] * item['count'])) as int?;
  }
  return sub;
}

Widget buildCartTotal(List items) {
  final subtotal = getSubtotal(items);

  final tax = 50;

  final delivery = 30;

  final total = subtotal + tax + delivery;

  return ListView(
    padding: const EdgeInsets.all(8),
    children: <Widget>[
      Container(
        height: 50,
        color: Colors.amber[600],
        child: Center(child: Text('Subtotal - $subtotal')),
      ),
      Container(
        height: 50,
        color: Colors.amber[500],
        child: Center(child: Text('Tax - $tax')),
      ),
      Container(
        height: 50,
        color: Colors.amber[100],
        child: Center(child: Text('Delivery - $delivery')),
      ),
      Container(
        height: 50,
        color: Colors.amber[100],
        child: Center(child: Text('Total =  $total')),
      ),
    ],
  );
}

Widget buildcartitems(List items) => ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
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
                          onPressed: () {
                            item['count'] = item['count'] + 1;
                          },
                          child: Icon(Icons.add)),
                      Text(
                        item["count"].toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (item['count'] > 0) {
                              item['count'] = item['count'] - 1;
                            }
                          },
                          child: Icon(Icons.remove)),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
getPage(navPage, userPersonalInfo) {
  switch (navPage) {
    case "Account Settings":
      {
        return AccountSettings();
      }
    case "FAQ":
      {
        return Faq();
      }
    case "My Cards":
      {
        return Cards();
      }
    case "My Orders":
      {
        return MyOrders();
      }

    case "Payments and Banking":
      {
        return Payments();
      }
    case "Personal Information":
      {
        return PersonalInfo(userInfo: userPersonalInfo);
      }
    case "Storage and Data":
      {
        return StorageData();
      }
    case "Logout":
      {
        return logout();
      }

    default:
      {
        print(navPage);
        return VisitsEx(hospitalName: navPage, userInfo: userPersonalInfo);
      }
  }
}

logout() {}
