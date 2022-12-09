// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:project/screens/CalendarScreen/widget/Calendar.dart';
import 'package:project/screens/HomeScreen/widget/taskTab.dart';

// import '../../../db/funtion/taskDbFunctions.dart';
import '../../../db/model/dataModel.dart';
// import '../../../main.dart';
import '../../../function/themeColor.dart';
// import '../../HomeScreen/widget/taskEventContainer.dart';
// import '../../HomeScreen/widget/taskTab.dart';

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// ValueNotifier<List<DateTime>> date = ValueNotifier([]);

class CalenderTask extends StatefulWidget {
  const CalenderTask({super.key});

  @override
  State<CalenderTask> createState() => _CalenderTaskState();
}

class _CalenderTaskState extends State<CalenderTask> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        taskInDay.clear();
        taskOfDay(globTaskList);
        // print("$index index");
        final data = taskInDay[0];
        // List<TaskModel> sortedDayList = [];

        // final Box<TaskModel> taskBox;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Text(
              data.description,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'comic',
                  fontSize: 26,
                  color: rBlack),
              // ),

              // ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('hh:mm a').format(data.date),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'comic',
                              fontSize: 20,
                              color: rBlack)),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 65,
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Text(
                                'high',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'comic',
                                    fontSize: 20,
                                    color: rBlack),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: cRed),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
      itemCount: taskInDay.length,
      // itemCount: 1,
    );
  }
}

taskOfDay(List<TaskModel> list) {
  // taskInDay.clear();
  for (int i = 0; i < list.length; i++) {
    DateTime tskDate = list[i].date;
    if (DateTime(tskDate.year, tskDate.month, tskDate.day) ==
        DateTime(focusedDay.year, focusedDay.month, focusedDay.day)) {
      taskInDay.add(list[i]);
      print("look ${taskInDay[0].date}");
    }
  }
}

List<TaskModel> taskInDay = [];
