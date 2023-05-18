import 'package:flutter/material.dart';
import 'package:healthcareit/components/listObject.dart';

class VisitsEx extends StatefulWidget {
  @override
  State<VisitsEx> createState() => _VisitsState();
}

class _VisitsState extends State<VisitsEx> {
  @override
  Widget build(BuildContext context) {
    List fetchedData = [
      {
        "_id": "645200814fcac016618df063",
        "name": "VisitPurpose1",
        "email": "date",
        "__v": 0
      },
      {
        "_id": "6452189268e6b826871743c7",
        "name": "VisitPurpose2",
        "email": "date",
        "__v": 0
      },
      {
        "_id": "6453785e1144977889e3b9c6",
        "name": "VisitPurpose3",
        "email": "date",
        "__v": 0
      },
    ];
    return Column(
        children: [Expanded(child: buildUsers(fetchedData, "visitsDetail"))]);
  }
}
