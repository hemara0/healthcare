import 'package:flutter/material.dart';
import 'package:healthcareit/components/listOnly.dart';
import 'package:healthcareit/home/payments/sample.dart';

import '../model/user.dart';

class PayBills extends StatefulWidget {
  late User userInfo;
  PayBills({super.key, required this.userInfo});
  @override
  State<PayBills> createState() => _PayBillsState();
}

class _PayBillsState extends State<PayBills> {
  @override
  Widget build(BuildContext context) {
    User info = widget.userInfo;
    List upiFields = ['PhonePe', 'Paytm', 'Google Pay'];
    List netBankingFields = ['HDFC card', 'SBI card'];
    List others = [];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment Options'),
          actions: [
            ElevatedButton(
              onPressed: () {
                //PaymentPage();
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('UPI TEST'),
                      ),
                      body: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: PaymentPage()),
                    );
                  },
                ));
              },
              child: const Icon(Icons.bookmark),
            ),
          ],
        ),
        body: Column(children: [
          const SizedBox(
            height: 50, // Set the desired height
            child: Text(
              'UPI',
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(child: Container(child: buildlist(upiFields, info))),
          const SizedBox(
            height: 50, // Set the desired height
            child: Text(
              'Credit and Debit Cards',
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(child: Container(child: buildlist(netBankingFields, info))),
          const SizedBox(
            height: 50, // Set the desired height
            child: Text(
              'Other Payment Methods',
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(child: Container(child: buildlist(others, info))),
        ]));
  }
}
