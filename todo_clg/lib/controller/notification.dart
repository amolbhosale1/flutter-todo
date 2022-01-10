import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static const channelId = '123';

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final IOSInitializationSettings initializationSettingsIOS =
        // ignore: prefer_const_constructors
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: null);

    tz.initializeTimeZones();
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    'channel ID',
    'channel name',
    'channel description',
    playSound: false,
    icon: '@mipmap/ic_launcher',
    priority: Priority.high,
    importance: Importance.high,
     
  );

  Future<void> showNotifications(int number, String Title, String Desc) async {
    await flutterLocalNotificationsPlugin.show(
      number,
      Title,
      Desc,
      NotificationDetails(android: _androidNotificationDetails),
    );
  }

  Future<void> scheduleNotifications(
      int number, String title, String desc, DateTime? dateTime) async {
    // final String ct = await FlutterNativeTimezone.getLocalTimezone();
    // print(ct);
    DateTime now = DateTime.now();

    print(now);

    // var cc = now.toString();
    // List<String> dd = cc.split(".");
    // var ss = dd.last;
    // var js = ss.split("");
    // var aa = js.toString();
    // print(aa);
    //if (aa){

    //}
    //DateTime n = tz.TZDateTime.local();
    // void ggg() {
    //   try {
    var consec;
    if (dateTime != null) {
      var monsub = (dateTime.month - now.month);
      var yearsub = (dateTime.year - now.year);
      var datersub = (dateTime.day - now.day);
      var housub = (dateTime.hour - now.hour);
      var minsub = (dateTime.minute - now.minute);
      var secsub = (dateTime.second - now.second);

      //print(yearsub);
      //  print(monsub);
      //  print(dateTime);
      //   print(housub);
      //print(minsub);

      consec = (monsub * 2629746) +
          (datersub * 86400) +
          (housub * 60 * 60) +
          (minsub * 60) +
          (secsub);
      // var eee = 11;
      //print(consec);
      //return consec;
    }
    // } catch (e) {
    print(consec);
    //}
    //}

    //ggg();

    //DateTime zonedTime = nn.subtract(Duration(days: now.month));
    // print(n);
    //print(zonedTime);
    // print((tz.TZDateTime.from(
    //     DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour,
    //         dateTime.minute),
    //     tz.local)));

    await flutterLocalNotificationsPlugin.zonedSchedule(
        number,
        title,
        desc,
        //tz.TZDateTime.from(DateTime(dateTime.year,dateTime.month,dateTime.day),tz.local),
        tz.TZDateTime.now(tz.local).add(Duration(seconds: consec)),
        //tz.TZDateTime.scheduledDate=dateTime,
        NotificationDetails(android: _androidNotificationDetails),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        //matchDateTimeComponents: DateTimeComponents.time
        );
    //DateTimeComponents? matchDateTimeComponents = DateTimeComponents.time;

    
    // await flutterLocalNotificationsPlugin.periodicallyShow(
    //     number,
    //     title,
    //     desc,
    //     RepeatInterval.daily,
    //      NotificationDetails(android: _androidNotificationDetails),
    //     androidAllowWhileIdle: true,
    //          );
  
  }



  Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

Future selectNotification(String? payload) async {
  // print("raje");
}
