import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/core/bloc/bloc_observer.dart';
import 'package:moga/core/database/cache/cache_helper.dart';
import 'package:moga/core/services/service_locator.dart';
import "package:moga/core/widgets/error_used_when_you_don't_expect.dart";
import 'package:moga/core/common/firebase/get_token&handle_notification.dart';
import 'app/mogha.dart';
import 'package:flutter/services.dart';

import 'core/common/firebase/firebase_options.dart';

void main() async {
  FlutterErrorWidget();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await notificationHandler();
  Bloc.observer = MyBlocObserver();
  await initServiceLocator();
  await sl<CacheHelper>().init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const Mogha());
  });
}
