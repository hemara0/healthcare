import 'package:flutter/material.dart';
import 'package:healthcareit/model/user.dart';
import 'package:healthcareit/pages/visitsPage.dart';
import 'package:healthcareit/pages/visitsDetail.dart';

Widget buildUsers(List users, String navPage) => ListView.builder(
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
                      title: Text(navPage),
                    ),
                    body: Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: getPage(navPage),
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

Widget getPage(navPage) {
  if (navPage == "visitsDetail") {
    return VisitsDetailEx();
  } else {
    return VisitsEx();
  }
}
