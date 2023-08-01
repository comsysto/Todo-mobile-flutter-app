import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _localNotifications;
  final BehaviorSubject<String?> _onNotification;

  const NotificationService(
    this._localNotifications,
    this._onNotification,
  );

  Future<void> init() async {
    await _initializeNotificationSettings();
    await _askAndroidPermission();
    await _initTimeZone();
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    final notificationDetails = await _getNotificationDetails();
    _localNotifications.show(id, title, body, notificationDetails, payload: payload);
  }

  Future showSchedueledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async {
    final notificationDetails = await _getNotificationDetails();
    _localNotifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  Future<void> _initializeNotificationSettings() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true,
    );

    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) => _onNotification.add(details.payload),
    );
  }

  Future<bool?>? _askAndroidPermission() => _localNotifications
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();

  Future<void> _initTimeZone() async {
    tz.initializeTimeZones();
    final locationName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(locationName));
  }

  Future<NotificationDetails> _getNotificationDetails() async {
    const androidDetails = AndroidNotificationDetails(
      'protaly_channel_id',
      'protaly_notifications',
      channelDescription: 'Protlay notification channel',
      importance: Importance.max,
    );
    const darwinDetails = DarwinNotificationDetails();
    return const NotificationDetails(android: androidDetails, iOS: darwinDetails);
  }
}
