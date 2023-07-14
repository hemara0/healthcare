import 'dart:convert';
import 'package:healthcareit/components/listObject.dart';
import 'package:http/http.dart' as http;
import 'package:healthcareit/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthcareit/provider/provider.dart';
import 'package:healthcareit/services/addHospital.dart';

import '../components/listOnly.dart';

class Records extends StatefulWidget {
  //final User userPersonalInfo;
  //Records({required this.userPersonalInfo});
  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {


  @override
  Widget build(BuildContext context) {
    //User userPersonalInfo = widget.userPersonalInfo;
    return Column(children: [
      Container(
          height: 50,
          color: Colors.blue,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return GFG();
                },
              ));
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Hospitals'),
                SizedBox(
                  width: 230,
                ),
                Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ],
            ),
          )),
      Expanded(
          child: FutureBuilder<User>(
              // future: getUserDetails().then((value) {
              //   List userHospitals1 = [];
              //   for (var hospitals in value.userHospitals) {
              //     String hospitalname = hospitals.hospitalName;
              //     userHospitals1.add(hospitalname);
              //   }
              //   return userHospitals1;
              // }),
              future: getUserDetails(),
              builder: (context, snap) {
                if ((snap.data == null)) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return buildlist(
                      snap.data!.userHospitals
                          .map((hospital) => hospital.hospitalName)
                          .toList(),
                      snap.data!);
                }
              }))
    ]);
  }

  Future<User> getUserDetails() async {
    print("My Records Main page");
    // Future.delayed(const Duration(seconds: 5), () async {}
    var userPersonalinfo = await fetchUserData();
    print('##############');
    print(userPersonalinfo.userHospitals);

    return userPersonalinfo;
  }
}
