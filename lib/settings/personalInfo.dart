import 'dart:async';
import 'package:flutter/material.dart';
import '../provider/provider.dart';

class PersonalInfo extends StatefulWidget {
  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool _isEnabled = false;

  // static var userPersonalinfo = {
  //   "_id": "645f679ebef9653d9304e3c7",
  //   "user_name": "samplename2",
  //   "user_email": "email32",
  //   "user_dob": "1999-09-09",
  //   "user_mobile": "9876543210",
  //   "user_bloodgroup": "AB+",
  //   "user_address_street": "76, 3rd cross",
  //   "user_pincode": "560090",
  //   "user_city": "Bangalore",
  //   "user_state": "Karnataka",
  //   "user_country": "India",
  //   "user_govtids": [
  //     {"aadhar": "1234567890"},
  //     {"DL": "12345"}
  //   ],
  //   "user_hospitals": [
  //     {
  //       "hosp1": ["visit1", "visit2", "visit3"]
  //     },
  //     {
  //       "hosp2": ["visit1"]
  //     },
  //     {
  //       "hosp3": ["visit1", "visit2"]
  //     }
  //   ],
  //   "user_lastlogin": "2023-05-13T10:33:51.162Z",
  //   "__v": 0
  // };
  // List users = [
  //   userPersonalinfo.userName,
  //   userPersonalinfo.userEmail,
  //   userPersonalinfo.userDOB,
  //   userPersonalinfo.userMobile,
  //   userPersonalinfo.userBloodGroup,
  //   userPersonalinfo.userAddressStreet,
  //   userPersonalinfo.userPincode,
  //   userPersonalinfo.userCity,
  //   userPersonalinfo.userState,
  //   userPersonalinfo.userCountry,
  // ];

  // List users = [
  //   userPersonalinfo['user_name'],
  //   userPersonalinfo['user_email'],
  //   userPersonalinfo['user_dob'],
  //   userPersonalinfo['user_mobile'],
  //   userPersonalinfo['user_bloodgroup'],
  //   userPersonalinfo['user_address_street'],
  //   userPersonalinfo['user_pincode'],
  //   userPersonalinfo['user_city'],
  //   userPersonalinfo['user_state'],
  //   userPersonalinfo['user_country'],
  // ];
  List<TextEditingController> _controllers = [];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: FutureBuilder<List>(
            future: getUserDetails(),
            builder: (context, snap) {
              if ((snap.data == null)) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    itemCount: snap.data!.length,
                    itemBuilder: (context, index) {
                      _controllers.add(TextEditingController());
                      final user = snap.data![index];
                      return Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                            onTap: () {
                              setState(() {
                                _isEnabled = !_isEnabled;
                              });
                            },
                            trailing: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            title: TextField(
                              enabled: _isEnabled,
                              controller: _controllers[index],
                              decoration: InputDecoration(
                                hintText: user,
                              ),
                            )
                            // subtitle: Text(
                            //   users[index],
                            //   style: const TextStyle(fontSize: 14, color: Colors.white),
                            // ),
                            ),
                      );
                    });
              }
              throw Exception('except in listview');
            }),
      ),
      SizedBox(
        height: 50,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      saveAndSend(_controllers);
                    },
                    child: Text("Save"))),
            Expanded(
                child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: Text("Discard"))),
          ],
        ),
      )
    ]);
  }

  void saveAndSend(List<TextEditingController> controllers) {
    var userEditedinfo = {};
    List keyList = [
      'user_name',
      'user_email',
      'user_dob',
      'user_mobile',
      'user_bloodgroup',
      'user_address_street',
      'user_pincode',
      'user_city',
      'user_state',
      'user_country'
    ];
    for (int i = 0; i < keyList.length; i++) {
      userEditedinfo[keyList[i]] = controllers[i].text;
    }
    //userEditedinfo['user_hospitals'] = ["hosp1", "hosp2"];
    updateData(userEditedinfo);
  }

  Future<List> getUserDetails() async {
    print("******************");
    // Future.delayed(const Duration(seconds: 5), () async {
    var userPersonalinfo1 = await fetchUserData();
    print('##############');

    //print(userPersonalinfo1);
    List users = [
      userPersonalinfo1.userName,
      userPersonalinfo1.userEmail,
      userPersonalinfo1.userDOB,
      userPersonalinfo1.userMobile,
      userPersonalinfo1.userBloodGroup,
      userPersonalinfo1.userAddressStreet,
      userPersonalinfo1.userPincode,
      userPersonalinfo1.userCity,
      userPersonalinfo1.userState,
      userPersonalinfo1.userCountry,
    ];
    return users;
    //});
  }
}
