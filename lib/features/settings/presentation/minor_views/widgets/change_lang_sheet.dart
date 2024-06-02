import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:moga/core/bloc/global_cubit/app_language_cubit.dart';
import 'package:moga/features/post/presentation/views/widgets/default_app_bar.dart';

class ChangeLanguageSheet extends StatefulWidget {
  const ChangeLanguageSheet({super.key});

  @override
  State<ChangeLanguageSheet> createState() => _ChangeLanguageSheetState();
}

class _ChangeLanguageSheetState extends State<ChangeLanguageSheet> {
  final _languages = ["English", "العربية"];
  late String _startLang;

  @override
  void initState() {
    _startLang = BlocProvider.of<GlobalCubit>(context).langCode == 'en'
        ? 'English'
        : 'العربية';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 270,
      width: double.infinity,
      child: Column(
        children: [
          DefaultAppBar(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 1,
            title: 'Change Language',
            centerTitle: true,
            style: TextStyle(
              fontSize: 24,
              letterSpacing: 1.5,
              fontFamily: 'Dosis',
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: Column(
                children: [
                  RadioGroup<String>.builder(
                    groupValue: _startLang,
                    onChanged: (updatedLang) {
                      changeLang(updatedLang);
                    },
                    items: _languages,
                    itemBuilder: (item) => RadioButtonBuilder(
                      item,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeLang(updatedLang) {
    setState(() {
      _startLang = updatedLang!;
      if (_startLang == _languages[0]) {
        BlocProvider.of<GlobalCubit>(context).changeLang('en');
      } else {
        BlocProvider.of<GlobalCubit>(context).changeLang('ar');
      }
      Future.delayed(Duration(seconds: 1)).whenComplete(() {
        GoRouter.of(context).pop();
      });
    });
  }
}
