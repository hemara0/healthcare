import 'package:flutter/material.dart';
import 'package:healthcareit/services/addHospital.dart';

class Records extends StatefulWidget {
  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return GFG();
                },
              ));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('Hospitals'),
                SizedBox(
                  width: 200,
                ),
                Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ]));
  }
}
