import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:project/db/funtion/eventDbFunctions.dart';
import 'package:project/db/funtion/taskDbFunctions.dart';
import 'package:project/db/model/dataModel.dart';
import 'package:project/db/model/eventDataModel.dart';

import '../../../function/themeColor.dart';

import 'EventImage.dart';
import 'newDate.dart';

bool _priority = false;
TaskModel? taskTemp;
DateTime tempDate = DateTime.now();
TimeOfDay tempTime = TimeOfDay.now();

class AddTaskEvent extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  // ignore: prefer_typing_uninitialized_variables
  var homeIndex;
  String mode;
  AddTaskEvent({super.key, this.homeIndex = 0, required this.mode, this.data});

  @override
  State<AddTaskEvent> createState() => _AddTaskEventState();
}

class _AddTaskEventState extends State<AddTaskEvent> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("this is mode ${widget.mode}");
    // (widget.homeIndex == 1) ? widget.mode == 'AE' : widget.mode == 'AT';
    if (widget.mode == 'ET' || widget.mode == 'EE') {
      descriptionController.text = widget.data.description;
      locationController.text = widget.data.location;
      timeController.text =
          DateFormat('dd MMM yyy hh:mm a').format(widget.data.date);
      if (widget.data != null) {
        tempDate = widget.data.date;
      }
    }

    final taskDB = Hive.openBox<TaskModel>('task_db');
    final eventDB = Hive.openBox<EventModel>('event_db');

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: cBlack),
        // height: 200,
        // color: cBlack,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    modeFind(widget.mode),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'comic',
                        fontSize: 23,
                        color: rWhite),
                  ),
                  TextButton(
                      onPressed: () {
                        addData(widget.homeIndex);

                        // print("${descriptionController.text}");
                        // print("${locationController.text}");
                        Navigator.pop(context);
                        setState(() {
                          imgeGlob = 'x';
                        });
                      },
                      child: Container(
                        width: 65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: cGreen),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            'save',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'comic',
                                fontSize: 20,
                                color: rBlack),
                          ),
                        ),
                      ))
                ],
              ),
              Offstage(
                  offstage: hideImg(widget.homeIndex),
                  child: EventImage(
                    data: widget.data,
                    mode: widget.mode,
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 7, left: 10, right: 10),
                child: TextField(
                  controller: descriptionController,
                  cursorColor: cGreen,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: rWhite),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: rWhite),
                    ),
                    labelText: 'Descripton',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'comic',
                        fontSize: 16,
                        color: rWhite),
                  ),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'comic',
                      fontSize: 17,
                      color: rWhite),
                  // cursorColor: cGreen,
                ),
              ),
              DateAndTime(),

              // MyHomePage(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 7, left: 10, right: 10),
                child: TextField(
                  controller: locationController,
                  cursorColor: cGreen,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    // focusColor: rWhite,
                    // fillColor: rWhite,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: rWhite),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: rWhite),
                    ),
                    labelText: 'Location',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'comic',
                        fontSize: 16,
                        color: rWhite),
                  ),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'comic',
                      fontSize: 17,
                      color: rWhite),
                  // cursorColor: cGreen,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 0, bottom: 8),
                child: Text(
                  'priority :',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'comic',
                      fontSize: 20,
                      color: rWhite),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        _priority = true;
                        print("$_priority @ high");
                      },
                      child: Container(
                        width: 65,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            'high',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'comic',
                                fontSize: 20,
                                color: rBlack),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: cRed),
                      )),
                  TextButton(
                      onPressed: () {
                        _priority = false;
                        print("$_priority @ low");
                      },
                      child: Container(
                        width: 65,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            'low',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'comic',
                                fontSize: 20,
                                color: rBlack),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: cYellow),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bool hideImg(homeIndex) {
    if (homeIndex == 0) {
      return true;
    } else {
      return false;
    }
  }

  String modeFind(
    String mode,
  ) {
    if (mode == 'AT') {
      return 'Add task';
    } else if (mode == 'AE') {
      return 'Add event';
    } else if (mode == 'R') {
      return 'Reschedule';
    } else if (mode == 'ET') {
      return 'Edit task';
    } else if (mode == 'EE') {
      return 'Edit event';
    }
    return 'X';
  }

  void addData(int homeIndex) {
    if (homeIndex == 0) {
      print("INdex at task  1");
      taskAdd(widget.mode);
    } else if (homeIndex == 1) {
      print("INdex at event  2");
      eventAdd(widget.mode);
    }
  }

  void taskAdd(mode) async {
    final _id = DateTime.now().toString();
    final _description = descriptionController.text.trim();
    // final _date = 'ddate';
    final _date = tempDate;
    final _time = 'ttime';
    final _location = locationController.text.trim();
    // final _priority = false;
    final _alarm = false;

    final _task = TaskModel(
        id: _id,
        description: _description,
        date: _date,
        time: _time,
        location: _location,
        priority: _priority,
        isAlarm: _alarm);
    if (mode == 'AT') {
      addTask(_task);
    } else if (mode == 'ET') {
      editTask(widget.data.id, context, _task);
      Navigator.of(context).pop();
    }
    // print(_task.date);
    // print('$_id look time');
  }

  void eventAdd(mode) async {
    final _imagePath = imgeGlob;
    final _id = DateTime.now().toString();
    final _description = descriptionController.text.trim();
    final _date = tempDate;
    final _time = 'ttime';
    final _location = locationController.text.trim();
    // final _priority = false;
    final _alarm = false;

    final _event = EventModel(
        id: _id,
        description: _description,
        time: _time,
        location: _location,
        priority: _priority,
        isAlarm: _alarm,
        imagePath: _imagePath,
        date: _date);
    print("image glob is x");
    imgFlag = false;
    setState(() {
      imgeGlob = 'x';
      imgFlag = false;
    });

    if (mode == 'AE') {
      addEvent(_event);
    } else if (mode == 'EE') {
      editEvent(widget.data.id, context, _event);
      Navigator.of(context).pop();
    }

    // print('$_date look date');
    // print('$_time  look time');
    // print("aluva");
  }
}
