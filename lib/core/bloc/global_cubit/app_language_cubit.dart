import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/core/database/cache/cache_helper.dart';
import '../../services/service_locator.dart';
import 'app_language_states.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  String langCode = 'ar';
  static GlobalCubit get(context) => BlocProvider.of(context);
  bool isDark = true;
  IconData? status = CupertinoIcons.moon_stars_fill;

  //! get lang and set it in sharedPrefrances
  void changeLang(String codeLang) async {
    emit(ChangeLangLoading());
    langCode = codeLang;
    await sl<CacheHelper>().changLanguage(codeLang);
    emit(ChangeLangSuccess());
  }

  //! update langauge and use it while starting app
  void updateLangage() {
    emit(ChangeLangLoading());
    final cachedLang = sl<CacheHelper>().getCachedLanguage();
    langCode = cachedLang;
    emit(ChangeLangSuccess());
  }

  //! Change App Theme
  void changeTheme() async {
    isDark = !isDark;
    status =
        isDark ? CupertinoIcons.sun_max_fill : CupertinoIcons.moon_stars_fill;
    await sl<CacheHelper>().saveData(key: 'isDark', value: isDark);
    emit(ChangeThemeState());
  }

  //! Get App Theme
  void getTheme() async {
    isDark = await sl<CacheHelper>().getData(key: 'isDark') ?? true;
    emit(GetThemeState());
  }
}
