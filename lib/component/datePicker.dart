import 'package:flutter/material.dart';

class leaveRequest extends StatefulWidget {
  const leaveRequest({Key? key}) : super(key: key);

  @override
  State<leaveRequest> createState() => _leaveRequestState();
}

class _leaveRequestState extends State<leaveRequest> {
  DateTime? _date;
  @override
  Widget build(BuildContext context) {
    _dateString() {
      if (_date == null) {
        return 'Please choose a date';
      } else {
        return '${_date?.day} - ${_date?.month} - ${_date?.year}';
      }
    }

    ;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Leave Request",
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              _dateString(),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  final reasult = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2050),
                  );
                  if (reasult != null) {
                    setState(() {
                      _date = reasult;
                    });
                  }
                },
                icon: const Icon(Icons.calendar_today),
                label: const Text("Choose Date"))
          ],
        ),
      ),
    );
  }
}
