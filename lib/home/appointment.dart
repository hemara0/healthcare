import 'package:flutter/material.dart';
import 'package:healthcareit/model/user.dart';

import '../components/listObject.dart';
import '../provider/provider.dart';
import 'myAppointments.dart';

class AppointmentPage extends StatefulWidget {
  late User userInfo;
  AppointmentPage({required this.userInfo});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  List<TextEditingController> _appointment = [];
  @override
  Widget build(BuildContext context) {
    User info = widget.userInfo;
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
      Icons.type_specimen_outlined,
      Icons.track_changes
    ];
    //DateTime? _selectedDate;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Book Appointment'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('My Appointments'),
                      ),
                      body: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: MyAppointments(
                            userInfo: info, fieldIcons: fieldIcons),
                      ),
                    );
                  },
                ));
              },
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
                          if (appointmentFields[index] == 'Date') {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030),
                            ).then((pickedDate) => {
                                  if (pickedDate != null)
                                    {
                                      setState(() {
                                        //                                       _selectedDate = pickedDate;
                                        _appointment[index].text =
                                            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                                      })
                                    }
                                });
                          }
                          if (appointmentFields[index] == 'Time') {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((pickedTime) => {
                                  if (pickedTime != null)
                                    {
                                      setState(() {
                                        _appointment[index].text = pickedTime
                                            .format(context)
                                            .toString();
                                      })
                                    }
                                });
                          }
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
        reasonOfVisit: appointment[4].text,
        status: "Requested");
    userPersonalinfo.userOrders.appointment.add(appDetails);

    await updateData(userPersonalinfo);
  }
}
