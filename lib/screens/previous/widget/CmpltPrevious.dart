import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/main.dart';

import '../../../db/funtion/taskDbFunctions.dart';
import '../../../db/model/dataModel.dart';
import '../../../function/themeColor.dart';
import '../../HomeScreen/widget/addTaskEvent.dart';
import '../../HomeScreen/widget/taskTab.dart';
import '../../taskView/TaskView.dart';

List<TaskModel> donePrevious = [];
List<TaskModel> pendingPrevious = [];

class CmpltPrevious extends StatefulWidget {
  const CmpltPrevious({super.key});

  @override
  State<CmpltPrevious> createState() => _CmpltPreviousState();
}

class _CmpltPreviousState extends State<CmpltPrevious> {
  @override
  Widget build(BuildContext context) {
    donePrevious =
        pastTaskArray.where((element) => element.isAlarm == true).toList();
    return ListView(children: [
      ValueListenableBuilder(
          valueListenable: taskListNotifier,
          builder: (
            BuildContext ctx,
            List<TaskModel> taskList,
            Widget? child,
          ) {
            return ListView.builder(
                itemCount: donePrevious.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  // print("$index index");
                  final data = donePrevious[index];
                  print('$index\n');

                  return
                      // Text('hello world');
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TaskView()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  color: cGreen),
                              child: Container(
                                padding: const EdgeInsets.all(17),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            DateFormat('dd MMM yyy hh:mm a')
                                                .format(data.date),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'comic',
                                                fontSize: 22,
                                                color: rWhite),
                                          ),
                                          Icon(
                                            Icons.warning_amber_rounded,
                                            size: 30,
                                            color: colorPic(data.priority),
                                          )
                                        ]),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 8),
                                      child: Text(data.description,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'comic',
                                            fontSize: 21,
                                            color: rWhite,
                                          )),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18),
                                          child: Text(
                                            data.location,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'comic',
                                                fontSize: 19,
                                                color: rWhite),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete_outline,
                                            color: rBlack,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            // deleteSelect(homeIndex, context);

                                            showDialog(
                                              context: context,
                                              builder: ((context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  backgroundColor: cBlack,
                                                  title: Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                        color: rWhite,
                                                        fontFamily: 'comic'),
                                                  ),
                                                  content: Text(
                                                    "Are you sure you want to delete ?",
                                                    style: TextStyle(
                                                        color: rWhite,
                                                        fontFamily: 'comic'),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      213,
                                                                      213,
                                                                      213),
                                                              fontFamily:
                                                                  'comic')),
                                                    ),
                                                    TextButton(
                                                        onPressed: () {
                                                          deleteTask(
                                                              data.id, context);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                          "Delete",
                                                          style: TextStyle(
                                                              color:
                                                                  (Colors.red),
                                                              fontFamily:
                                                                  'comic',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  ],
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20))),
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AddTaskEvent(
                                                    mode: 'ET',
                                                    homeIndex: 0,
                                                    data: data,
                                                  );
                                                },
                                              );
                                            },
                                            icon: Icon(
                                              Icons.loop_rounded,
                                              color: rBlack,
                                              size: 28,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                });
          })
    ]);
  }

  Color colorPic(bool priority) {
    if (priority) {
      return cRed;
    } else {
      return cYellow;
    }
  }
}
// }
