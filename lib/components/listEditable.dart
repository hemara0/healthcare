import 'package:flutter/material.dart';
import 'package:healthcareit/components/listOnly.dart';

import '../components/listObject.dart';

class ListEdit extends StatefulWidget {
  @override
  State<ListEdit> createState() => _ListEditState();
}

class _ListEditState extends State<ListEdit> {
  bool _isEnabled = false;
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        enabled: _isEnabled,
        decoration: InputDecoration(
          hintText: 'Enter a text',
        ),
      ),

      // The icon button which will notify list item to change
      trailing: GestureDetector(
        child: new Icon(
          Icons.edit,
          color: Colors.black,
        ),
        onTap: () {
          setState(() {
            _isEnabled = !_isEnabled;
          });
        },
      ),
    );
  }
}
