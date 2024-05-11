import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:moga/core/widgets/custom_toast.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('on background message');
  print(message.data.toString());

  showToast(
    message: 'on background message',
    state: ToastStates.success,
  );
}
