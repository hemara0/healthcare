import 'package:flutter/material.dart';

import '../components/listObject.dart';
import '../components/listOnly.dart';
import '../model/user.dart';
import '../provider/provider.dart';

class MyAppointments extends StatefulWidget {
  late User userInfo;
  late List fieldIcons;
  MyAppointments({required this.userInfo, required this.fieldIcons});
  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  @override
  Widget build(BuildContext context) {
    User info = widget.userInfo;
    List infoRequested = [];
    List infoApproved = [];
    List fieldIcons = widget.fieldIcons;

    return FutureBuilder<List>(
        future: getDeatils(),
        builder: (context, snap) {
          if ((snap.data == null)) {
            return const Center(child: CircularProgressIndicator());
          } else {
            for (var req in snap.data!) {
              if (req.status == 'Requested') {
                infoRequested.add(req);
              } else {
                infoApproved.add(req);
              }
            }
            return Column(children: [
              const SizedBox(
                height: 50, // Set the desired height
                child: Text(
                  'Requested',
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                  child: Container(
                      child: buildAppointments(
                          infoRequested, Colors.red, fieldIcons))),
              const SizedBox(
                height: 50, // Set the desired height
                child: Text(
                  'Approved',
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                  child: Container(
                      child: buildAppointments(
                          infoApproved, Colors.green, fieldIcons))),
            ]);
          }
        });
  }

  Future<List> getDeatils() async {
    var userPersonalinfo = await fetchUserData();
    List appDetails = userPersonalinfo.userOrders.appointment;
    return appDetails;
  }
}
