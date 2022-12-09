import 'package:flutter/material.dart';
import 'package:project/main.dart';
import '../SearchScreen/SearchHome.dart';
import 'widget/Calendar.dart';
import 'widget/calendarEveTsk.dart';
import '../../../function/themeColor.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: cBlack,
        backgroundColor: Colors.grey,
        appBar: AppBar(
          foregroundColor: cGreen,
          backgroundColor: cBlack,
          elevation: 0,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchHome()));
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body: ListView(
          children: [Calendar(), CalendarEveTask()],
        ));
  }
}

Future<void> pickDate(context) async {
  DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), //get today's date
      firstDate: DateTime(
          2000), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101));
}
