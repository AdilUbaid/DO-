// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:project/db/funtion/taskDbFunctions.dart';
import 'package:project/screens/HomeScreen/ScreenHome.dart';
import '../../../db/model/dataModel.dart';
import '../../../function/globals.dart';
import 'taskEventContainer.dart';
import 'package:project/function/globals.dart' as globals;

// List<DateTime>dateArray;
List<TaskModel> globTaskList = [];
DateTime notifiationTIme = DateTime(2017, 9, 7);
List<TaskModel> futureTaskArray = [];
List<TaskModel> pastTaskArray = [];
TaskModel? globNotifiData;

class TaskTab extends StatefulWidget {
  TaskTab({super.key, required this.homeIndex});

  var homeIndex;

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  @override
  Widget build(BuildContext context) {
    int flag = 0;
    return Stack(
      children: [
        ValueListenableBuilder(
            valueListenable: taskListNotifier,
            builder: (
              BuildContext ctx,
              List<TaskModel> taskList,
              Widget? child,
            ) {
              List<DateTime> dateArrayFinal = [];
              dateArrayFinal = dateSaver(taskList.length, taskList);
              globTaskList = List<TaskModel>.from(taskList);
              // dateToNotify(dateArrayFinal.length, dateArrayFinal);
              // print('outer loop il work cheytho ?$dateArrayFinal');
              // dateArray = taskList[0].date;
              // print('LOOK HERE');
              // print(taskList[0].date);

              print("this is the time $notifiationTIme");

              return ListView.builder(
                itemBuilder: (ctx, index) {
                  // print("$index index");
                  final data = taskList[index];
                  List<TaskModel> sortedDayList = [];
                  sortListByDate(taskList.length, taskList);
                  notifiationTIme = futureTaskArray[0].date;
                  globNotifiData = futureTaskArray[0];
                  // DateTime compareDate = DateTime(taskList[0].date.year,
                  // taskList[0].date.month, taskList[0].date.day);
                  // sortedDayList = List.from(taskList.where((compareDate == dateArrayFinal[index])(element) => false))

                  sortedDayList = taskList
                      .where((e) =>
                          (DateTime(e.date.year, e.date.month, e.date.day) ==
                              dateArrayFinal[index]) &&
                          dateArrayFinal[index].isAfter(afterNow))
                      .toList();
                  sortedDayList.sort(
                      (TaskModel a, TaskModel b) => a.date.compareTo(b.date));
                  // print('HERE IS THE SORTED DAY LIST ${sortedDayList[index].date}');

                  // print(taskList[index].date);

                  final Box<TaskModel> taskBox;
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index2) {
                        // print("this is index ${index},$index2");
                        // if (flag == 0) {
                        //   notifiationTIme = sortedDayList[0].date;
                        //   flag = 1;
                        //   // print(
                        //   //     "this is the date to notify ${notifiationTIme}");
                        // }
                        // if (notifiationTIme.isAfter(sortedDayList[0].date)) {
                        //   notifiationTIme = sortedDayList[0].date;
                        // }
                        // print("this is the date to notify ${notifiationTIme}");
                        // print("$index index");
                        final data = sortedDayList[index2];
                        // dateToNotify(sortedDayList.length, sortedDayList);
                        // print(taskList[index].date);

                        final Box<TaskModel> taskBox;
                        return TaskEventContainer(
                          homeIndex: widget.homeIndex,
                          data: data,
                          index: index2,
                          id: data.id,
                        );
                      },
                      itemCount: sortedDayList.length);
                },
                itemCount: dateArrayFinal.length,
                // itemCount: 1,
              );
            }),
      ],
    );
    //
  }

  List<DateTime> dateSaver(int length, List<TaskModel> list) {
    List<DateTime> dateArray = [];
    // DateTime = new List(5);
    for (int i = 0; i < length; i++) {
      dateArray.add(
          DateTime(list[i].date.year, list[i].date.month, list[i].date.day));
      // DateTime(list[i].date.year, list[i].date.month, list[i].date.day);
    }

    dateArray = dateArray.toSet().toList();
    dateArray.sort((DateTime a, DateTime b) => a.compareTo(b));
    // print('arraay dates are HERE $dateArray');
    // print('arraay distinct are HERE $distinctIds');
    for (int i = 0; i < dateArray.length; i++) {
      // if(dateArray.da)

    }
    return dateArray;
  }

  void sortListByDate(int length, List<TaskModel> list) {
    int k = 0;
    int j = 0;
    pastTaskArray.clear();
    for (int i = 0; i < length; i++) {
      if (list[i].date.isAfter(DateTime.now())) {
        futureTaskArray.add(list[i]);
        k++;
      } else if (list[i].date.isBefore(DateTime.now())) {
        pastTaskArray.add(list[i]);
        j++;
      }
    }
    futureTaskArray
        .sort((TaskModel a, TaskModel b) => a.date.compareTo(b.date));
    pastTaskArray.sort((TaskModel b, TaskModel a) => a.date.compareTo(b.date));
    // print("look here past ${pastTaskArray[1].description}");
  }

  // void dateToNotify(int length, List<TaskModel> list) {
  //   for (int i = 0; i < length; i++) {
  //     print("dateToNotify working...${list[i].date}");
  //     print(DateTime.now().difference(notifiationTIme));
  //     print(DateTime.now().difference(list[i].date));
  //     // print("keri");

  //     if (
  //         // notifiationTIme.isBefore(DateTime.now()) &&
  //         list[i].date.isAfter(DateTime.now()) &&
  //             (DateTime.now().difference(notifiationTIme) >
  //                 DateTime.now().difference(list[i].date))) {
  //       notifiationTIme = list[i].date;
  //       print("THiis is the notification time$notifiationTIme");
  //       // print(DateTime(timeNow.year, timeNow.month, timeNow.day, timeNow.hour,
  //       //     timeNow.minute));
  //       break;
  //     }
  //   }
  // }
}
