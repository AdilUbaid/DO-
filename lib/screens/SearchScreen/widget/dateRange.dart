import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import '../SearchHome.dart';

// class DateRange extends StatefulWidget {
//   Function? function;

//   String? actionKey;
//   DateRange({super.key, this.function, this.actionKey});

//   @override
//   State<DateRange> createState() => _DateRangeState();
// }

// class _DateRangeState extends State<DateRange> {
//   DateTimeRange dateRange =
//       DateTimeRange(start: DateTime(2022, 11, 5), end: DateTime(2022, 12, 25));
//   // print("${start.year} / ${start.month} / ${start.day}");
//   // print("${end.year} / ${end.month} / ${end.day}");
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

DateTimeRange dateRange =
    DateTimeRange(start: DateTime.now(), end: DateTime(2022, 12, 25));

Future picRange(BuildContext context, Function function) async {
  DateTimeRange? newDateRange = await showDateRangePicker(
    context: context,
    initialDateRange: dateRange,
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );
  if (newDateRange == null) return;
  print(
      "${newDateRange.start.year} / ${newDateRange.start.month} / ${newDateRange.start.day}");
  print(
      "${newDateRange.end.year} / ${newDateRange.end.month} / ${newDateRange.end.day}");
  dateRange = newDateRange;
  function(globSearchKey, globAction = 'R');
}











// // import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:project/screens/SearchScreen/SearchHome.dart';

// import '../../../function/themeColor.dart';

// DateTimeRange dateRange =
//     DateTimeRange(start: DateTime(2022, 11, 05), end: DateTime(2022, 12, 31));
// DateTimeRange? newDateRange;

// class DateRange extends StatefulWidget {
//   Function function;

//   String actionKey;

//   DateRange({
//     super.key,
//     required this.actionKey,
//     required this.function,
//   });

//   @override
//   State<DateRange> createState() => _DateRangeState();
// }

// class _DateRangeState extends State<DateRange> {
//   // DateTimeRange dateRange =
//   //     DateTimeRange(start: DateTime(2022, 11, 05), end: DateTime(2022, 12, 24));
//   Color cColor = Colors.grey;
//   @override
//   Widget build(BuildContext context) {
//     final start = dateRange.start;
//     final end = dateRange.end;
//     return TextButton(
//         onPressed: () {
//           setState(() {
//             cColor = Color.fromARGB(255, 255, 255, 255);
//             containDate();
//             // pickDateRange();
//             setState(() {
//               cColor = Colors.grey;
//             });
//           });
//         },
//         child: Container(
//           width: 75,
//           height: 30,
//           decoration: BoxDecoration(
//               color: cColor, borderRadius: BorderRadius.circular(20)),
//           child: Center(
//             child: Text(
//               'Date',
//               style: TextStyle(color: rBlack),
//             ),
//           ),
//         ));
//   }

//   pickDateRange() async {
//     newDateRange = await showDateRangePicker(
//         context: context,
//         // initialDateRange: dateRange,
//         firstDate: DateTime(1900),
//         lastDate: DateTime(2100));
//     if (newDateRange == null) return;
//     setState(() => dateRange = newDateRange!);
//     widget.function(globSearchKey, globAction = widget.actionKey);
    
//   }

//   Widget containDate() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(child: Container(height: 300, child: pickDateRange())),
//     );
    
//   }
// }
