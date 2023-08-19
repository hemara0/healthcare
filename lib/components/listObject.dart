import 'package:flutter/material.dart';
import 'package:healthcareit/home/medicalStore/itemDetails.dart';
import 'package:healthcareit/model/user.dart';
import 'package:healthcareit/pages/visitsPage.dart';
import 'package:healthcareit/pages/visitsDetail.dart';

import 'listOnly.dart';

class ItemCard extends StatelessWidget {
  var product;
  //final Function press;
  ItemCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(200),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.photo),
          ),
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 100),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                product['name'],
              ),
            )),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 100),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                product['price'].toString(),
              ),
            ))
          ],
        )
      ],
    );
  }
}

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

Widget buildHospitalVisits(List users, String navPage) => ListView.builder(
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
              users[index].visitDescription,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            subtitle: Text(
              users[index].visitDate,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        );
      },
    );

Widget buildAppointments(List users, sentColor, fieldIcons) => ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          color: sentColor,
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(users[index].status),
                    ),
                    body: buildAppointment(users[index], fieldIcons),
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
              users[index].hospitalId,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            subtitle: Text(
              users[index].visitDate,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        );
      },
    );

// Widget buildmedicines(List items) => ListView.builder(
//     // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     //     crossAxisCount: 2, mainAxisSpacing: 20.0, crossAxisSpacing: 20.0),
//     itemCount: items.length,
//     itemBuilder: (context, index) {
//       //   return ItemCard(
//       //     product: items[index],
//       //   );
//       // });
//       return ListTile(
//         title: Text(items[index]['name']),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ItemDetails()),
//           );
//         },
//       );
//     });

getPage(navPage) {
  if (navPage == "visitsDetail") {
    return VisitsDetailEx();
  } else {
    //return VisitsEx(hospitalName: navPage, userInfo: ,);
    print('Exit');
  }
}
