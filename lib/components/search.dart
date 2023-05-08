import 'package:flutter/material.dart';

class SearchEx extends StatefulWidget {
  @override
  State<SearchEx> createState() => _SearchExState();
}

class _SearchExState extends State<SearchEx> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        // Add padding around the search bar
        padding: const EdgeInsets.symmetric(horizontal: 1.0),

        // Use a Material design search bar
        child: SizedBox(
            width: 350,
            height: 100,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                // Add a clear button to the search bar
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _searchController.clear(),
                ),
                // Add a search icon or button to the search bar
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Perform the search here
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            )));
  }
}
