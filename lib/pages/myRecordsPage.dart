import 'dart:convert';
import 'package:healthcareit/components/listObject.dart';
import 'package:http/http.dart' as http;
import 'package:healthcareit/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthcareit/provider/provider.dart';
import 'package:healthcareit/services/addHospital.dart';

class Records extends StatefulWidget {
  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  //late final usersFuture;

  // @override
  // void initState() {
  //   super.initState();

  //   usersFuture = getUsers();
  // }

  // Future<List<User>> fetchedData = getUsers();
  // static Future<List<User>> getUsers() async {
  //   // const url = '';
  //   // final response = await http.get(Uri.parse(url));
  //   // final body = json.decode(response.body);
  //   dynamic data = fetchData();
  //   return data.map<User>(User.fromJson).toList();
  // }

  @override
  Widget build(BuildContext context) {
    List fetchedData = [
      {
        "_id": "645200814fcac016618df063",
        "name": "hospital1",
        "email": "Address1",
        "__v": 0
      },
      {
        "_id": "6452189268e6b826871743c7",
        "name": "hospital2",
        "email": "Address2",
        "__v": 0
      },
      {
        "_id": "6453785e1144977889e3b9c6",
        "name": "hospital3",
        "email": "Address3",
        "__v": 0
      },
      {
        "_id": "645378db1144977889e3b9c8",
        "name": "hospital4",
        "email": "Address4",
        "__v": 0
      },
      {
        "_id": "6454b90b9b621e9e81850170",
        "name": "hospital5",
        "email": "Address5",
        "__v": 0
      }
    ];
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
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
      Expanded(child: buildUsers(fetchedData, "Visits"))
    ]);
  }
}
