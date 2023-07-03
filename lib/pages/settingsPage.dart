import 'package:flutter/material.dart';
import 'package:healthcareit/components/listOnly.dart';

import '../components/listObject.dart';
import '../model/user.dart';
import '../provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    // return Column(children: [
    //   Container(
    //       height: 50,
    //       color: Colors.blue,
    //       child: ListTile(
    //         leading: Icon(Icons.person),
    //         title: Text("Name"),
    //       )),
    //Expanded(child: buildlist(settingsData, "sample"))
    return RefreshIndicator(
        onRefresh: _refreshData,
        child: FutureBuilder<User>(
            future: getUserDetails(),
            builder: (context, snap) {
              if ((snap.data == null)) {
                return const Center(child: CircularProgressIndicator());
                //print('except at settings');
              } else {
                return Column(children: [
                  Container(
                      height: 50,
                      color: Colors.blue,
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(snap.data!.userName),
                      )),
                  Expanded(child: buildlist(settingsData, snap.data!))
                ]);
              }
              //throw Exception('except');
            }));
    // ]);
  }

  Future<User> getUserDetails() async {
    print("Settings Main page");
    // Future.delayed(const Duration(seconds: 5), () async {
    var userPersonalinfo = await fetchUserData();
    print(userPersonalinfo);
    print('##############');
    return userPersonalinfo;
  }

  Future<void> _refreshData() async {
    // Simulate a delay before refreshing the data
    await Future.delayed(Duration(seconds: 2));
  }
}
