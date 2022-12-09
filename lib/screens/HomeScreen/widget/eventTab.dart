import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/db/model/eventDataModel.dart';
import '../../../db/funtion/eventDbFunctions.dart';
import 'taskEventContainer.dart';
class EventTab extends StatefulWidget {
  EventTab({super.key, required this.homeIndex});
  var homeIndex;

  @override
  State<EventTab> createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
            valueListenable: eventListNotifier,
            builder: (
              BuildContext ctx,
              List<EventModel> eventList,
              Widget? child,
            ) {
              return ListView.builder(
                  itemBuilder: (ctx, index) {
                    print("$index index @ event");
                    final data = eventList[index];

                    final Box<EventModel> taskBox;
                    return TaskEventContainer(
                      homeIndex: widget.homeIndex,
                      data: data,
                      index: index,
                    );
                  },
                  itemCount: eventList.length);
            }),
      ],
    );
    //
  }
}
