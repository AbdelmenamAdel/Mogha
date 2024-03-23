import 'package:flutter/material.dart';
import 'widgets/send_code_view_body.dart';

class SendCodeView extends StatefulWidget {
  const SendCodeView({super.key});

  @override
  State<SendCodeView> createState() => _SendCodeViewState();
}

class _SendCodeViewState extends State<SendCodeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    animationOfLoginButton();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void animationOfLoginButton() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: .7, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SendCodeViewBody(
      scale: _animation.value,
    );
  }
}
