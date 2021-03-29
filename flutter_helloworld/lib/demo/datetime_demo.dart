import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DatetimeDemo extends StatefulWidget {
  DatetimeDemo({Key key}) : super(key: key);

  @override
  _DatetimeDemoState createState() => _DatetimeDemoState();
}

class _DatetimeDemoState extends State<DatetimeDemo> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);
  Future<void> _selectDate() async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (date == null) return;
    setState(() {
      selectedDate = date;
    });
  }

  Future<void> _selectDayTime() async {
    final TimeOfDay time =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (time == null) return;
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Datetime'),
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: _selectDate,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(DateFormat.yMMMM().format(selectedDate)),
                        // Text(DateFormat.yMMM().format(selectedDate)),
                        Text(DateFormat.yMEd().format(selectedDate)),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: _selectDayTime,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(selectedTime.format(context)),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
