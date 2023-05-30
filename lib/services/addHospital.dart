import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/user.dart';
import '../provider/provider.dart';

class GFG extends StatefulWidget {
  const GFG({Key? key}) : super(key: key);

  @override
  State<GFG> createState() => _GFGState();
}

class _GFGState extends State<GFG> {
  // dynamic userEditedinfo = {
  //     'user_hospitals': ['hosp1', 'hosp2']
  //   };

  // Future<Map> getUsers() async {
  // const url = '';
  // final response = await http.get(Uri.parse(url));
  // final body = json.decode(response.body);
  //dynamic data = fetchData();

  //   return userEditedinfo.map<User>(User.toJson);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Hospital",
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
    "Appolo",
    "Columbia Asia",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var hospital in searchTerms) {
      if (hospital.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(hospital);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var hospital in searchTerms) {
      if (hospital.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(hospital);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
            title: Text(result),
            // onTap: () => ScaffoldMessenger.of(context)
            //     .showSnackBar(SnackBar(content: Text("$result added"))));
            onTap: (() {
              saveAndSend(result);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(result.toString())));
            }));

        // return InkWell(
        //   child: Text(result.toString()),
        //   onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.toString()))),
        // );
      },
    );
  }

  void saveAndSend(hospital) async {
    User userPersonalinfo1 = await fetchUserData();
    print(userPersonalinfo1.userHospitals);
    Hospital hospitalEdited = Hospital(hospitalName: hospital, visits: []);
    userPersonalinfo1.userHospitals.add(hospitalEdited);
    print(userPersonalinfo1.userHospitals);
    //Map<String, dynamic> userJson = hospitalEdited.toJson();
    //String userEditedinfo = jsonEncode(userPersonalinfo1);
    // userEditedinfo['user_hospitals'] =
    //     userEditedinfo['user_hospitals'].add(hospital);
    // var userEditedinfo = JSON.parse(userEditedinfo1);
    updateData(userPersonalinfo1);
  }
}
