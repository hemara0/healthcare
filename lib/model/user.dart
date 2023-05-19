class User {
  User(
    this.user_name,
    this.user_email,
    this.user_dob,
    this.user_mobile,
    this.user_bloodgroup,
    this.user_address_street,
    this.user_pincode,
    this.user_city,
    this.user_state,
    this.user_country,
    this.user_govtids,
    this.user_hospitals,
    this.user_lastlogin,
    this.user_registereddate,
  );
  final String user_name;
  final String user_email;
  final String user_dob;
  final String user_mobile;
  final String user_bloodgroup;
  final String user_address_street;
  final String user_pincode;
  final String user_city;
  final String user_state;
  final String user_country;
  final List user_govtids;
  final List user_hospitals;
  final String user_lastlogin;
  final String user_registereddate;
  // named constructor
  User.fromJson(Map<String, dynamic> json)
      : user_name = json['user_name'],
        user_email = json['user_email'],
        user_dob = json['user_dob'],
        user_mobile = json['user_mobile'],
        user_bloodgroup = json['user_bloodgroup'],
        user_address_street = json['user_address_street'],
        user_pincode = json['user_pincode'],
        user_city = json['user_city'],
        user_state = json['user_state'],
        user_country = json['user_country'],
        user_hospitals = json['user_hospitals'],
        user_govtids = json['user_govtids'],
        user_lastlogin = json['user_lastlogin'],
        user_registereddate = json['user_registereddate'];
  // method
//   Map<String, dynamic> toJson() {
//     return {
//       'user_name': user_name,
//       'user_email': user_email,
//       'user_email': user_email,
//       'user_email': user_email,
//       'user_email': user_email,
//       'user_email': user_email,
//       'user_email': user_email,
//       'user_email': user_email,
//       'user_email': user_email,
//       'user_email': user_email,
//     };
//   }
}
