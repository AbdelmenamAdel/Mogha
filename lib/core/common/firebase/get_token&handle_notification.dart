import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:moga/core/widgets/custom_toast.dart';
import 'dart:developer';

import 'package:moga/core/common/firebase/firebase_messaging_background_handler.dart';

Future<void> notificationHandler() async {
  String? token = await FirebaseMessaging.instance.getToken();
  log('user token is ${token}');
  await FirebaseMessaging.onMessage.listen((event) {
    print('on message');
    log(event.data.toString());
    log(event.notification.toString());
    showToast(
      message: 'on message',
      state: ToastStates.success,
    );
  });

  // when click on notification to open app
  await FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('on message opened app');
    print(event.data.toString());
    showToast(
      message: 'on message opened app',
      state: ToastStates.success,
    );
  });

  // background fcm
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
}
