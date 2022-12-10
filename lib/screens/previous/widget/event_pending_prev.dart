import 'package:flutter/material.dart';
import 'package:project/db/funtion/eventDbFunctions.dart';
import 'package:project/db/model/eventDataModel.dart';
import 'package:project/screens/previous/widget/CmpltPrevious.dart';
import 'package:project/screens/previous/widget/pending_view.dart';

import '../../../function/themeColor.dart';

List<EventModel> eventPendingPrevious = [];
class PendingPrevious extends StatefulWidget {
  const PendingPrevious({super.key});

  @override
  State<PendingPrevious> createState() => _PendingPreviousState();
}

class _PendingPreviousState extends State<PendingPrevious> {
  get pastEventArray => null;

  @override
  Widget build(BuildContext context) {
    eventPendingPrevious =
        pastEventArray.where((element) => element.isAlarm == false).toList();
    return ListView(children: [
      ValueListenableBuilder(
          valueListenable: eventListNotifier,
          builder: (
            BuildContext ctx,
            List<EventModel> eventList,
            Widget? child,
          ) {
            return ListView.builder(
                itemCount: pendingPrevious.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final data = pendingPrevious[index];
                  print('$index\n');

                  return Padding(
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
                      child: PendingView(
                        data: data,
                      ),
                    ),
                  );
                });
          })
    ]);
  }
}
