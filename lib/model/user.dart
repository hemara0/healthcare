class User {
  final String userName;
  final String userEmail;
  final String userDOB;
  final String userMobile;
  final List<GovernmentId> userGovtIds;
  final List<Hospital> userHospitals;
  final String userAddressStreet;
  final String userBloodGroup;
  final String userCity;
  final String userCountry;
  final String userPincode;
  final String userState;

  User({
    required this.userName,
    required this.userEmail,
    required this.userDOB,
    required this.userMobile,
    required this.userGovtIds,
    required this.userHospitals,
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

    return User(
      userName: json['user_name'] as String? ?? '',
      userEmail: json['user_email'] as String? ?? '',
      userDOB: json['user_dob'] as String? ?? '',
      userMobile: json['user_mobile'] as String? ?? '',
      userGovtIds: govtIds,
      userHospitals: hospitals,
      userAddressStreet: json['user_address_street'] as String? ?? '',
      userBloodGroup: json['user_bloodgroup'] as String? ?? '',
      userCity: json['user_city'] as String? ?? '',
      userCountry: json['user_country'] as String? ?? '',
      userPincode: json['user_pincode'] as String? ?? '',
      userState: json['user_state'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson(User userPersonalinfo1) {
    final Map<String, dynamic> data = {
      'user_name': userName,
      'user_email': userEmail,
      'user_dob': userDOB,
      'user_mobile': userMobile,
      'user_govtids': userGovtIds.map((govtId) => govtId.toJson()).toList(),
      'user_hospitals':
          userHospitals.map((hospital) => hospital.toJson()).toList(),
      'user_address_street': userAddressStreet,
      'user_bloodgroup': userBloodGroup,
      'user_city': userCity,
      'user_country': userCountry,
      'user_pincode': userPincode,
      'user_state': userState,
    };

    return data;
  }
}

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
