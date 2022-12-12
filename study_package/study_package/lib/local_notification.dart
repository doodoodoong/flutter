import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final notifications = FlutterLocalNotificationsPlugin();

// 1. 앱로드할 때 기본 설정
initNotification() async {
  // 안드로이드용 아이콘 파일 이름
  var androidSetting =
      const AndroidInitializationSettings('mipmap/ic_launcher');

  // iOS에서 앱 로드시 유저에게 권한 요청
  var iosSetting = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true);

  var initializationSettings =
      InitializationSettings(android: androidSetting, iOS: iosSetting);

  await notifications.initialize(
    initializationSettings,
    // 알림 누를 때 함수 실행하고 싶으면
    // onSelectNotification: 함수명
  );
}

showNotification() async {
  var androidDetails = const AndroidNotificationDetails(
      'Channel ID', 'alarm content',
      priority: Priority.high,
      importance: Importance.max,
      color: Color.fromARGB(255, 255, 0, 0));
  var iosDetails = const DarwinNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);

  // 알림 id, 제목, 내용 채우기
  notifications.show(1, 'Title', 'content',
      NotificationDetails(android: androidDetails, iOS: iosDetails));
}
