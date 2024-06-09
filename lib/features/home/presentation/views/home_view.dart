import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';
import 'package:moga/features/social/presentation/views/widgets/custom_app_bar.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  bool _bool = true;

  @override
  void initState() {
    super.initState();
    initAnimationControllers();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        appBar: Hidable(
          controller: scrollController,
          child: CustomAppBar(
            iconButton: IconButton(
              onPressed: () {
                if (_bool == true) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                _bool = false;
              },
              icon: Icon(Icons.menu_rounded),
            ),
            title: 'Home',
          ),
        ),
        body: Stack(
          children: [
            HomeViewBody(
              scrollController: scrollController,
            ),
            CustomDrawer(
              condition: _bool,
              animation1: _animation1,
              animation2: _animation2,
              animation3: _animation3,
            ),
          ],
        ),
      ),
    );
  }

  void initAnimationControllers() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _animation1 = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _bool = true;
        }
      });
    _animation2 = Tween<double>(begin: 0, end: .3).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animation3 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }
}
