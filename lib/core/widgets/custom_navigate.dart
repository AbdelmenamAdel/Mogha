import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension Navigation on BuildContext {
  navigate(String route, BuildContext context) {
    return GoRouter.of(context).push(route);
  }
}
