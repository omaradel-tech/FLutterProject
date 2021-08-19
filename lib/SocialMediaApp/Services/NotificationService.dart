import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationService extends ChangeNotifier{
  final  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //initialize
  Future Initialize() async {
    AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('ic_launcher');
    IOSInitializationSettings iosInitializationSettings =
      IOSInitializationSettings();
    InitializationSettings initializationSettings =
      InitializationSettings(
          android: androidInitializationSettings,
          iOS: iosInitializationSettings
      );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  //show notification
  Future InstanceNotification(String name,String Text) async {
    AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('channelId', 'channelName', 'channelDescription');
    IOSNotificationDetails iosNotificationDetails =
      IOSNotificationDetails();

    NotificationDetails platform = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails
    );
     _flutterLocalNotificationsPlugin.show(
        0,
        'SocialMedia App',
        '($name)$Text',
        platform
    );
  }
}