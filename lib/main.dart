import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/db/model/dataModel.dart';
import 'package:project/db/model/eventDataModel.dart';
import 'package:project/function/taskSingle.dart';
import 'package:project/function/themeColor.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:project/screens/ScreenSplash/screenSplash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  List<DateTime> dateArray;
  TaskSingle task1 =
      TaskSingle('id', 'description', 'date', 'time', 'location', false, false);
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TaskModelAdapter().typeId)) {
    Hive.registerAdapter(TaskModelAdapter());
  }
  if (!Hive.isAdapterRegistered(EventModelAdapter().typeId)) {
    Hive.registerAdapter(EventModelAdapter());
  }

  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    null,
    [
      NotificationChannel(
        channelGroupKey: 'channel_group_key',
        channelKey: 'channel_key',
        channelName: 'channel_name',
        channelDescription: 'channel_description',
        importance: NotificationImportance.Max,
      )
    ],
    debug: true,
  );

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    //It would be more appropriate if you can show your own dialog
    //to the user before requesting the notifications permissons.
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications(
        permissions: [
          NotificationPermission.Alert,
          NotificationPermission.Sound,
          NotificationPermission.Badge,
          NotificationPermission.Vibration,
          NotificationPermission.Light,
          NotificationPermission.FullScreenIntent,
        ],
      );
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 255, 255, 255),
      ),

      // home: ScreenSplash(),
      home: ScreenSplash(),

      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', 'US')], //, Locale('pt', 'BR')],
    );
  }
}
