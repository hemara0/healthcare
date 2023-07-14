import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:healthcareit/components/search.dart';
import 'package:healthcareit/home/appointment.dart';
import 'package:healthcareit/home/insuranceCards.dart';
import 'package:healthcareit/home/medicalStore.dart';
import 'package:healthcareit/home/payBills.dart';
import 'package:healthcareit/model/user.dart';

import '../provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder<User>(
            future: getUser(),
            builder: (context, snap) {
              if ((snap.data == null)) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SearchEx(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox.fromSize(
                            size: Size(120, 120),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AppointmentPage(
                                                userInfo: snap.data!,
                                              )),
                                    );
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.book_online_outlined,
                                        size: 60,
                                      ), // <-- Icon
                                      Text("Book "),
                                      Text("Appointment") // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox.fromSize(
                            size: const Size(120, 120),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MedicalStore()),
                                    );
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.add_shopping_cart,
                                          size: 60), // <-- Icon
                                      Text("Medical"),
                                      Text("Store"), // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox.fromSize(
                            size: const Size(120, 120),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InsuranceCards()),
                                    );
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.payment,
                                        size: 60,
                                      ), // <-- Icon
                                      Text("Insurance"),
                                      Text("Cards") // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox.fromSize(
                            size: Size(120, 120),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PayBills(userInfo: snap.data!)),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.medical_services,
                                        size: 60,
                                      ), // <-- Icon
                                      Text("Pay Medical"),
                                      Text("bills") // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox.fromSize(
                            size: const Size(120, 120),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {},
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.payment,
                                        size: 60,
                                      ), // <-- Icon
                                      Text("Insurance"),
                                      Text("Cards") // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox.fromSize(
                            size: Size(120, 120),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {},
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.medical_services,
                                        size: 60,
                                      ), // <-- Icon
                                      Text("Pay Medical"),
                                      Text("bills") // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox.fromSize(
                            size: const Size(120, 120),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {},
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.payment,
                                        size: 60,
                                      ), // <-- Icon
                                      Text("Insurance"),
                                      Text("Cards") // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox.fromSize(
                            size: Size(120, 120),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.medical_services,
                                        size: 60,
                                      ), // <-- Icon
                                      Text("Pay Medical"),
                                      Text("bills") // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox.fromSize(
                            size: const Size(120, 120),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.payment,
                                        size: 60,
                                      ), // <-- Icon
                                      Text("Insurance"),
                                      Text("Cards") // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox.fromSize(
                            size: Size(120, 120),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.medical_services,
                                        size: 60,
                                      ), // <-- Icon
                                      Text("Pay Medical"),
                                      Text("bills") // <-- Text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ])
                  ],
                );
              }
            }));
  }

  Future<User> getUser() async {
    var userPersonalinfo = await fetchUserData();
    return userPersonalinfo;
  }
}
