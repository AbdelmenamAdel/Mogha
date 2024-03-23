import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/core/database/cache/cache_helper.dart';
import '../../services/service_locator.dart';
import 'app_language_states.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  String langCode = 'ar';

  //! get lang and set it in sharedPrefrances
  void changeLang(String codeLang) async{
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
}