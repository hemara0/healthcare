import 'package:flutter/material.dart';
import 'package:healthcareit/model/user.dart';

import '../provider/provider.dart';

class AppointmentPage extends StatefulWidget {
  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  List<TextEditingController> _appointment = [];
  @override
  Widget build(BuildContext context) {
    List appointmentFields = [
      'Hospital',
      'Doctor',
      'Date',
      'Time',
      'Reason of visit'
    ];
    List fieldIcons = [
      Icons.local_hospital_outlined,
      Icons.person_2_outlined,
      Icons.date_range_outlined,
      Icons.lock_clock_outlined,
      Icons.type_specimen_outlined
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Book Appointment'),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.bookmark),
            ),
          ],
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
                itemCount: appointmentFields.length,
                itemBuilder: (context, index) {
                  _appointment.add(TextEditingController());
                  return Card(
                    color: Colors.white,
                    //elevation: 4,
                    //margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                        onTap: () {
                          // setState(() {
                          //   _isEnabled = !_isEnabled;
                          // });
                        },
                        title: TextField(
                          //enabled: _isEnabled,
                          controller: _appointment[index],
                          decoration: InputDecoration(
                              labelText: appointmentFields[index],
                              icon: Icon(fieldIcons[index]),
                              border: const OutlineInputBorder()),
                        )),
                  );
                }),
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          saveAndSend(_appointment);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Your details are Updated")));
                        },
                        child: const Text("Book"))),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: const Text("Discard"))),
              ],
            ),
          )
        ]));
  }

  void saveAndSend(List<TextEditingController> appointment) async {
    var userPersonalinfo = await fetchUserData();
    Appointment appDetails;
    appDetails = Appointment(
        hospitalId: appointment[0].text,
        doctorId: appointment[1].text,
        bookingDate: DateTime.now().toString(),
        visitDate: appointment[2].text,
        visitTime: appointment[3].text,
        reasonOfVisit: appointment[4].text);
    userPersonalinfo.userOrders.appointment.add(appDetails);

    await updateData(userPersonalinfo);
  }
}
