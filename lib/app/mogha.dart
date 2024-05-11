import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moga/core/common/connectivity.dart';
import 'package:moga/core/common/start/there_is_a_connection.dart';
import 'package:moga/core/common/start/there_is_no_connection.dart';

class Mogha extends StatelessWidget {
  const Mogha({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return ValueListenableBuilder(
          valueListenable: ConnectivityController.instance.isConnected,
          builder: (_, value, __) {
            return value
                ? const ThereIsAConnectionStart()
                : const ThereIsNoconnection();
          },
        );
      },
    );
  }
}
