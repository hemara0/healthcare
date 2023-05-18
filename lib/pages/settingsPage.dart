import 'package:flutter/material.dart';
import 'package:healthcareit/components/listOnly.dart';

import '../components/listObject.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List settingsData = [
    "Personal Information",
    "Account Settings",
    "My Cards",
    "My Orders",
    "Payments and Banking",
    "Storage and Data",
    "FAQ",
    "Logout",
  ];
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 50,
          color: Colors.blue,
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text("Name"),
          )),
      Expanded(child: buildlist(settingsData))
    ]);
  }
}
