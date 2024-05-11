import 'package:flutter/material.dart';
import 'package:moga/core/common/screens/no_network_view.dart';

class ThereIsNoconnection extends StatelessWidget {
  const ThereIsNoconnection({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'No Network',
      debugShowCheckedModeBanner: false,
      home: const NoNetworkView(),
    );
  }
}
