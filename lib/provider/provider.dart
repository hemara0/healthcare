import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

// class FetchProvider extends ChangeNotifier {
//   final HttpClient = http.Client();
//   late List<dynamic> parsedFetchData;

//   //get request
//   Future fetchData() async {
//     final Uri restAPIURL = Uri.parse('http://localhost:3000/users');
//     http.Response response = await HttpClient.get(restAPIURL);
//     final Map parsedData = await json.decode(response.body.toString());
//     print(parsedData);
//     parsedFetchData = parsedData as List;
//   }
// }
_setHeaders() => {
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Access-Control-Allow-Origin": "*"
    };

// class CallApi {
//   final String _url = "http://localhost:3000/users";
//   postData(result, apiUrl) async {
//     dynamic data = {"name": "result", "email": "hema.h@gmail.com"};
//     return await http.post(Uri.parse(_url),
//         body: jsonEncode(data), headers: _setHeaders());
//   }
// }

dynamic fetchData() async {
  const String _url = "http://localhost:3000/users";
  final url = Uri.parse(_url);
  final response = await http.get(url);
  print(response.body);
  dynamic resBody = json.decode(response.body);
  return resBody;
}

Future<User> fetchUserData() async {
  await Future.delayed(const Duration(seconds: 2));
  const String _url = "http://localhost:3000/users/645f679ebef9653d9304e3c7";
  final url = Uri.parse(_url);
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    var user = User.fromJson(jsonData);
    return user;
  } else {
    throw Exception('Failed to fetch user data');
  }
}

Future<void> submitData(result) async {
  const String _url = "http://localhost:3000/users";
  final uri = Uri.parse(_url);
  dynamic data = result;
  final respose =
      await http.post(uri, body: jsonEncode(data), headers: _setHeaders());
  print(respose.statusCode);
  print(respose);
}

Future<void> updateData(result) async {
  const String _url = "http://localhost:3000/users/645f679ebef9653d9304e3c7";
  final uri = Uri.parse(_url);
  dynamic data = result;
  final respose =
      await http.patch(uri, body: jsonEncode(data), headers: _setHeaders());
  print(respose.statusCode);
  print(respose);
}
