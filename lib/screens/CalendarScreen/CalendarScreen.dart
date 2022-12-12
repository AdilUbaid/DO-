import 'package:flutter/material.dart';
import 'package:project/screens/CalendarScreen/widget/calenderTask.dart';
import '../SearchScreen/SearchHome.dart';
import 'widget/Calendar.dart';
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
        body: Column(
          // children: [Calendar(), CalendarEveTask()],
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Calendar(),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const CalenderTask(),
            ),
          ],
        ));
  }
}

// Future<void> pickDate(context) async {
//   DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(), //get today's date
//       firstDate: DateTime(
//           2000), //DateTime.now() - not to allow to choose before today.
//       lastDate: DateTime(2101));
// }
