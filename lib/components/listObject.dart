import 'package:flutter/material.dart';
import 'package:healthcareit/model/user.dart';

Widget buildUsers(List users) => ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          color: Colors.blue,
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            onTap: () {
              print('tapped');
            },
            // leading: Text(
            //   users[index]["_id"].toString(),
            //   style:
            //       const TextStyle(fontSize: 24, color: Colors.white),
            // ),
            title: Text(
              users[index]["name"],
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            subtitle: Text(
              users[index]['email'],
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        );
      },
    );
