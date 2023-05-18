import 'package:flutter/material.dart';
import 'package:healthcareit/settings/faq.dart';
import 'package:healthcareit/settings/myCards.dart';
import 'package:healthcareit/settings/orders.dart';
import 'package:healthcareit/settings/payments.dart';
import 'package:healthcareit/settings/personalInfo.dart';
import 'package:healthcareit/settings/storageData.dart';

import '../settings/account.dart';

Widget buildlist(List users) => ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          color: Colors.blue,
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(users[index]),
                    ),
                    body: Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: getPage(users[index]),
                    ),
                  );
                },
              ));
            },
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

getPage(navPage) {
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
        return Orders();
      }

    case "Payments and Banking":
      {
        return Payments();
      }
    case "Personal Information":
      {
        return PersonalInfo();
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
        //statements;
      }
      break;
  }
}

logout() {}
