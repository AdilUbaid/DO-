// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:project/main.dart';

// class NotificationService {

void initialAwesome(String title, String body) async {
  final audioPlayer = AudioPlayer();
  // bool isPlaying = false;
  // final player = AudioCache(prefix: 'assets/');
  // final url = await player.load('mixkit-scanning-sci-fi-alarm-905.wav');
  // audioPlayer.setSourceUrl(url.path);

  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 11,
      channelKey: 'channel_key', //Same as above in initilize,
      title: title,
      body: body,
      wakeUpScreen: true,
      fullScreenIntent: true,
      criticalAlert: true,

      //Other parameters
    ),
    actionButtons: <NotificationActionButton>[
      NotificationActionButton(key: 'done', label: 'done'),
      // NotificationActionButton(key: 'snooze', label: 'snooze'),
      NotificationActionButton(key: 'reschedule', label: 'reschedule'),
    ],
  );
  audioPlayer.play(AssetSource('mixkit-scanning-sci-fi-alarm-905.wav'),
      volume: 100);
  audioPlayer.setVolume(100);

  // AwesomeNotifications().actionStream.listen(
  //   (ReceivedAction receivedAction) {
  //     if (receivedAction.buttonKeyPressed == 'accept') {
  //       //Your code goes here
  //     } else if (receivedAction.buttonKeyPressed == 'reject') {
  //       //Your code goes here
  //     }

  //     //Here if the user clicks on the notification itself
  //     //without any button
  //   },
  // );
  //  Future<void> onActionReceivedMethod(
  //     ReceivedAction receivedAction) async {

  //   if(
  //     receivedAction.actionType == ActionType.SilentAction ||
  //     receivedAction.actionType == ActionType.SilentBackgroundAction
  //   ){
  //     // For background actions, you must hold the execution until the end
  //     print('Message sent via notification input: "${receivedAction.buttonKeyInput}"');
  //     await executeLongTaskInBackground();
  //   }
  //   else {
  //     MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
  //         '/notification-page',
  //             (route) =>
  //         (route.settings.name != '/notification-page') || route.isFirst,
  //         arguments: receivedAction);
  //   }
  // }
}
// void notifica
// void scheduleAwesome(String title,String body)async{
//   AwesomeNotifications().createNotification(
//                   content: NotificationContent(
//                     id: 10,
//                     channelKey: 'channel_key', //Same as above in initilize,
//                     title: title,
//                     body: body,
//                     wakeUpScreen: true,
//                     fullScreenIntent: true,
//                     criticalAlert: true,

//                     //Other parameters
//                   ),
//                   actionButtons: <NotificationActionButton>[
//                     NotificationActionButton(key: 'done', label: 'done'),
//                     NotificationActionButton(key: 'snooze', label: 'snooze'),
//                     NotificationActionButton(
//                         key: 'reschedule', label: 'reschedule'),
//                   ],
//                 );



//                 // AwesomeNotifications().actions
// }
  //               AwesomeNotifications().createNotification.listen(
  // (ReceivedAction receivedAction) {

  // if (receivedAction.buttonKeyPressed == 'accept') {
  //   //Your code goes here
  // } else if (receivedAction.buttonKeyPressed == 'reject') {
  //   //Your code goes here
  // }

  // Here if the user clicks on the notification itself
  // without any button

//   },
// );
// }


  
//   final AwesomeNotifications _flutterLocalNotificationsPlugin =
//       // FlutterLocalNotificationsPlugin();
//       AwesomeNotifications();
//   final AndroidInitializationSettings _androidInitializationSettings =
//       AndroidInitializationSettings('logo');

//   void initialiseNotifications() async {
//     InitializationSettings initializationSettings = InitializationSettings(
//       android: _androidInitializationSettings,
//     );
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   void sendNotification(String title, String body) async {
//     AndroidNotificationDetails androidNotificationDetails =
//         // ignore: prefer_const_constructors
//         AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max, priority: Priority.high);

//     NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);

//     await _flutterLocalNotificationsPlugin.show(
//         0, title, body, notificationDetails);
//   }

//   void scheduleNotification(String title, String body) async {
//     AndroidNotificationDetails androidNotificationDetails =
//         // ignore: prefer_const_constructors
//         AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max, priority: Priority.high);

//     NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);

//     await _flutterLocalNotificationsPlugin.periodicallyShow(
//         1, title, body, RepeatInterval.everyMinute, notificationDetails);
//   }

//   void stopNotifications() async {
//     // _flutterLocalNotificationsPlugin.cancel(0);
//     _flutterLocalNotificationsPlugin.cancelAll();
//   }
// }
