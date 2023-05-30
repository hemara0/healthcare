import 'package:flutter/material.dart';

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
}
