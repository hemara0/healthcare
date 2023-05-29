import 'package:flutter/material.dart';

import '../provider/provider.dart';

class Faq extends StatefulWidget {
  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            onPressed: () async {
              //getUserDetails();
            },
            child: Text("Discard")));
  }

  // void getUserDetails() async {
  //   print("******************");

  //   var userPersonalinfo1 = await fetchUserData();
  //   print('##############');

  //   List users = [
  //     userPersonalinfo1.userName,
  //     userPersonalinfo1.userEmail,
  //     userPersonalinfo1.userDOB,
  //     userPersonalinfo1.userMobile,
  //     userPersonalinfo1.userBloodGroup,
  //     userPersonalinfo1.userAddressStreet,
  //     userPersonalinfo1.userPincode,
  //     userPersonalinfo1.userCity,
  //     userPersonalinfo1.userState,
  //     userPersonalinfo1.userCountry,
  //   ];
  //   print(userPersonalinfo1.userName);
  // }
}
