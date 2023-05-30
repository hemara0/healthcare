import 'package:flutter/material.dart';
import 'package:healthcareit/components/listObject.dart';
import 'package:healthcareit/model/user.dart';
import '../provider/provider.dart';

class VisitsEx extends StatefulWidget {
  final String hospitalName;
  final User userInfo;
  const VisitsEx(
      {super.key, required this.hospitalName, required this.userInfo});
  @override
  State<VisitsEx> createState() => _VisitsState();
}

class _VisitsState extends State<VisitsEx> {
// List fetchedData = [
  //   {
  //     "_id": "645200814fcac016618df063",
  //     "name": "VisitPurpose1",
  //     "email": "date",
  //     "__v": 0
  //   },
  //   {
  //     "_id": "6452189268e6b826871743c7",
  //     "name": "VisitPurpose2",
  //     "email": "date",
  //     "__v": 0
  //   },
  //   {
  //     "_id": "6453785e1144977889e3b9c6",
  //     "name": "VisitPurpose3",
  //     "email": "date",
  //     "__v": 0
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    String name = widget.hospitalName;
    int ind = widget.userInfo.userHospitals
        .indexWhere((obj) => obj.hospitalName == name);
    var visits = widget.userInfo.userHospitals.elementAt(ind);
    List visitsDetails = visits.visits;
    print('hdgfhdsgfhgsdf');
    print(visitsDetails);
    return Column(children: [
      Expanded(

          // child: FutureBuilder<List>(
          //     future: getUserDetails(name, visitsDetails),
          //     builder: (context, snap) {
          //       if ((snap.data == null)) {
          //         return const Center(child: CircularProgressIndicator());
          //       } else {
          //         return buildHospitalVisits(visitsDetails, "visitsDetail");
          //       }
          //     }),
          child: buildHospitalVisits(visitsDetails, "visitsDetail")),
    ]);
  }

  // Future<List> getUserDetails(hospitalName, info) async {
  //print("******************");
  // Future.delayed(const Duration(seconds: 5), () async {
  //var userPersonalinfo1 = await fetchUserData();
  //print('##############');

  // for (var hospitals in info.userHospitals) {
  //   if (hospitals.hospitalName == hospitalName) {
  //     print(hospitals.hospitalName);
  //     return hospitals.visits;
  //   }
  // }
  //print(userPersonalinfo1);
  // List users = [
  //   userPersonalinfo1.userName,
  //   userPersonalinfo1.userEmail,
  //   userPersonalinfo1.userDOB,
  //   userPersonalinfo1.userMobile,
  //   userPersonalinfo1.userBloodGroup,
  //   userPersonalinfo1.userAddressStreet,
  //   userPersonalinfo1.userPincode,
  //   userPersonalinfo1.userCity,
  //   userPersonalinfo1.userState,
  //   userPersonalinfo1.userCountry,
  // ];
  // return users;
  //});
//     throw Exception('exception in getting visits');
//   }
}
