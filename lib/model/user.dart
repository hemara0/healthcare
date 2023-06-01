// class User {
//   final String userName;
//   final String userEmail;
//   final String userDOB;
//   final String userMobile;
//   final List<GovernmentId> userGovtIds;
//   final List<Hospital> userHospitals;
//   final Orders userOrders;
//   final String userAddressStreet;
//   final String userBloodGroup;
//   final String userCity;
//   final String userCountry;
//   final String userPincode;
//   final String userState;

//   User({
//     required this.userName,
//     required this.userEmail,
//     required this.userDOB,
//     required this.userMobile,
//     required this.userGovtIds,
//     required this.userHospitals,
//     required this.userOrders,
//     required this.userAddressStreet,
//     required this.userBloodGroup,
//     required this.userCity,
//     required this.userCountry,
//     required this.userPincode,
//     required this.userState,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     List<GovernmentId> govtIds = [];
//     if (json['user_govtids'] != null) {
//       govtIds = (json['user_govtids'] as List<dynamic>).map((govtId) {
//         return GovernmentId(
//           idType: govtId['idType'] as String? ?? '',
//           idNumber: govtId['idNumber'] as String? ?? '',
//         );
//       }).toList();
//     }

//     List<Hospital> hospitals = [];
//     if (json['user_hospitals'] != null) {
//       hospitals = (json['user_hospitals'] as List<dynamic>).map((hospital) {
//         List<Visit> visits = [];
//         if (hospital['visits'] != null) {
//           visits = (hospital['visits'] as List<dynamic>).map((visit) {
//             return Visit(
//               visitDescription: visit['visitDescription'] as String? ?? '',
//               visitDate: visit['visitDate'] as String? ?? '',
//             );
//           }).toList();
//         }

//         return Hospital(
//           hospitalName: hospital['hospitalName'] as String? ?? '',
//           visits: visits,
//         );
//       }).toList();
//     }

//     // List<Orders> orders = [];
//     // if (json['user_orders'] != null) {
//     //   orders = (json['user_orders'] as List<dynamic>).map((order) {
//     //     List<Appointment> appointments = [];
//     //     if (order['appointment'] != null) {
//     //       appointments =
//     //           (order['appointment'] as List<dynamic>).map((appointment) {
//     //         return Appointment(
//     //           hospitalId: order['hospitalId'] as String? ?? '',
//     //           doctorId: order['doctorId'] as String? ?? '',
//     //           bookingDate: order['bookingDate'] as String? ?? '',
//     //           visitDate: order['visitDate'] as String? ?? '',
//     //           reasonOfVisit: order['reasonOfVisit'] as String? ?? '',
//     //           visitTime: order['visitDate'] as String? ?? '',
//     //         );
//     //       }).toList();
//     //     }

//     //     return Orders(
//     //       appointment: appointments,
//     //     );
//     //   }).toList();
//     // }

//     Orders orders = Orders.fromJson(json['user_orders']);

//     return User(
//       userName: json['user_name'] as String? ?? '',
//       userEmail: json['user_email'] as String? ?? '',
//       userDOB: json['user_dob'] as String? ?? '',
//       userMobile: json['user_mobile'] as String? ?? '',
//       userGovtIds: govtIds,
//       userHospitals: hospitals,
//       userOrders: orders,
//       userAddressStreet: json['user_address_street'] as String? ?? '',
//       userBloodGroup: json['user_bloodgroup'] as String? ?? '',
//       userCity: json['user_city'] as String? ?? '',
//       userCountry: json['user_country'] as String? ?? '',
//       userPincode: json['user_pincode'] as String? ?? '',
//       userState: json['user_state'] as String? ?? '',
//     );
//   }

  // Map<String, dynamic> toJson(User userPersonalinfo1) {
  //   final Map<String, dynamic> data = {
  //     'user_name': userName,
  //     'user_email': userEmail,
  //     'user_dob': userDOB,
  //     'user_mobile': userMobile,
  //     'user_govtids': userGovtIds.map((govtId) => govtId.toJson()).toList(),
  //     'user_hospitals':
  //         userHospitals.map((hospital) => hospital.toJson()).toList(),
  //     'user_orders': userOrders.toJson(),
  //     'user_address_street': userAddressStreet,
  //     'user_bloodgroup': userBloodGroup,
  //     'user_city': userCity,
  //     'user_country': userCountry,
  //     'user_pincode': userPincode,
  //     'user_state': userState,
  //   };

  //   return data;
  // }
// }

class GovernmentId {
  final String idType;
  final String idNumber;

  GovernmentId({
    required this.idType,
    required this.idNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'idType': idType,
      'idNumber': idNumber,
    };

    return data;
  }
}

class Hospital {
  final String hospitalName;
  final List<Visit> visits;

  Hospital({
    required this.hospitalName,
    required this.visits,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'hospitalName': hospitalName,
      'visits': visits.map((visit) => visit.toJson()).toList(),
    };

    return data;
  }
}

class Visit {
  final String visitDescription;
  final String visitDate;

  Visit({
    required this.visitDescription,
    required this.visitDate,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'visitDescription': visitDescription,
      'visitDate': visitDate,
    };

    return data;
  }
}

// class Orders {
//   List<Appointment> appointment;

//   Orders({
//     required this.appointment,
//   });

//   factory Orders.fromJson(Map<String, dynamic> json) {
//     List<Appointment> appointments = List<Appointment>.from(
//       json['appointment']
//           .map((appointment) => Appointment.fromJson(appointment)),
//     );

//     return Orders(appointment: appointments);
//   }

//   Map<String, dynamic> toJson() {
//     List<Map<String, dynamic>> appointmentJson =
//         appointment.map((appointment) => appointment.toJson()).toList();

//     return {
//       'appointment': appointmentJson,
//     };
//   }
// }

// class Appointment {
//   String hospitalId;
//   String doctorId;
//   String bookingDate;
//   String visitDate;
//   String visitTime;
//   String reasonOfVisit;

//   Appointment({
//     required this.hospitalId,
//     required this.doctorId,
//     required this.bookingDate,
//     required this.visitDate,
//     required this.visitTime,
//     required this.reasonOfVisit,
//   });

//   factory Appointment.fromJson(Map<String, dynamic> json) {
//     return Appointment(
//       hospitalId: json['hospitalId'],
//       doctorId: json['doctorId'],
//       bookingDate: json['bookingDate'],
//       visitDate: json['visitDate'],
//       visitTime: json['visitTime'],
//       reasonOfVisit: json['reasonOfVisit'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'hospitalId': hospitalId,
//       'doctorId': doctorId,
//       'bookingDate': bookingDate,
//       'visitDate': visitDate,
//       'visitTime': visitTime,
//       'reasonOfVisit': reasonOfVisit,
//     };
//   }
// }

class User {
  String userName;
  String userEmail;
  String userDob;
  String userMobile;
  List<GovernmentId> userGovtIds;
  List<Hospital> userHospitals;
  Orders userOrders;
  String userAddressStreet;
  String userBloodGroup;
  String userCity;
  String userCountry;
  String userPincode;
  String userState;

  User({
    required this.userName,
    required this.userEmail,
    required this.userDob,
    required this.userMobile,
    required this.userGovtIds,
    required this.userHospitals,
    required this.userOrders,
    required this.userAddressStreet,
    required this.userBloodGroup,
    required this.userCity,
    required this.userCountry,
    required this.userPincode,
    required this.userState,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    List<GovernmentId> govtIds = [];
    if (json['user_govtids'] != null) {
      govtIds = (json['user_govtids'] as List<dynamic>).map((govtId) {
        return GovernmentId(
          idType: govtId['idType'] as String? ?? '',
          idNumber: govtId['idNumber'] as String? ?? '',
        );
      }).toList();
    }

    List<Hospital> hospitals = [];
    if (json['user_hospitals'] != null) {
      hospitals = (json['user_hospitals'] as List<dynamic>).map((hospital) {
        List<Visit> visits = [];
        if (hospital['visits'] != null) {
          visits = (hospital['visits'] as List<dynamic>).map((visit) {
            return Visit(
              visitDescription: visit['visitDescription'] as String? ?? '',
              visitDate: visit['visitDate'] as String? ?? '',
            );
          }).toList();
        }

        return Hospital(
          hospitalName: hospital['hospitalName'] as String? ?? '',
          visits: visits,
        );
      }).toList();
    }

    Orders orders = Orders.fromJson(json['user_orders']);

    return User(
      userName: json['user_name'],
      userEmail: json['user_email'],
      userDob: json['user_dob'],
      userMobile: json['user_mobile'],
      userGovtIds: govtIds,
      userHospitals: hospitals,
      userOrders: orders,
      userAddressStreet: json['user_address_street'],
      userBloodGroup: json['user_bloodgroup'],
      userCity: json['user_city'],
      userCountry: json['user_country'],
      userPincode: json['user_pincode'],
      userState: json['user_state'],
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>>? govtIdsJson =
        userGovtIds.map((govtId) => govtId.toJson()).toList();
    List<Map<String, dynamic>>? hospitalsJson =
        userHospitals.map((hospital) => hospital.toJson()).toList();

    return {
      'user_name': userName,
      'user_email': userEmail,
      'user_dob': userDob,
      'user_mobile': userMobile,
      'user_govtids': govtIdsJson,
      'user_hospitals': hospitalsJson,
      'user_orders': userOrders.toJson(),
      'user_address_street': userAddressStreet,
      'user_bloodgroup': userBloodGroup,
      'user_city': userCity,
      'user_country': userCountry,
      'user_pincode': userPincode,
      'user_state': userState,
    };
  }
}

class Orders {
  List<Appointment> appointment;

  Orders({
    required this.appointment,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    List<Appointment> appointments = List<Appointment>.from(
      json['appointment']
          .map((appointment) => Appointment.fromJson(appointment)),
    );

    return Orders(appointment: appointments);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> appointmentJson =
        appointment.map((appointment) => appointment.toJson()).toList();

    return {
      'appointment': appointmentJson,
    };
  }
}

class Appointment {
  String hospitalId;
  String doctorId;
  String bookingDate;
  String visitDate;
  String visitTime;
  String reasonOfVisit;

  Appointment({
    required this.hospitalId,
    required this.doctorId,
    required this.bookingDate,
    required this.visitDate,
    required this.visitTime,
    required this.reasonOfVisit,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      hospitalId: json['hospitalId'],
      doctorId: json['doctorId'],
      bookingDate: json['bookingDate'],
      visitDate: json['visitDate'],
      visitTime: json['visitTime'],
      reasonOfVisit: json['reasonOfVisit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hospitalId': hospitalId,
      'doctorId': doctorId,
      'bookingDate': bookingDate,
      'visitDate': visitDate,
      'visitTime': visitTime,
      'reasonOfVisit': reasonOfVisit,
    };
  }
}
