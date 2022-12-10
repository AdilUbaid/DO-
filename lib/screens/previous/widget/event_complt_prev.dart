import 'package:flutter/material.dart';
import 'package:project/db/funtion/eventDbFunctions.dart';
import 'package:project/db/model/eventDataModel.dart';

import '../../../function/themeColor.dart';
import '../../HomeScreen/widget/eventTab.dart';
import 'complete_view.dart';

List<EventModel> eventDonePrevious = [];


class CmpltPrevious extends StatefulWidget {
  const CmpltPrevious({super.key});

  @override
  State<CmpltPrevious> createState() => _CmpltPreviousState();
}

class _CmpltPreviousState extends State<CmpltPrevious> {
  @override
  Widget build(BuildContext context) {
    eventDonePrevious =
        pastEventArray.where((element) => element.isAlarm == true).toList();
    return ListView(children: [
      ValueListenableBuilder(
          valueListenable: eventListNotifier,
          builder: (
            BuildContext ctx,
            List<EventModel> eventList,
            Widget? child,
          ) {
            return ListView.builder(
                itemCount: eventDonePrevious.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  // print("$index index");
                  final data = eventDonePrevious[index];
                  print('$index\n');

                  return
                      // Text('hello world');
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          // child: GestureDetector(
                          //   onTap: () {
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) => TaskView()));
                          //   },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  color: cGreen),
                              child: CompleteView(data: data,),
                              ),
                            // ),
                          );
                });
          })
    ]);
  }

  
}
// }