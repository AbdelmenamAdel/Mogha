import 'package:get_it/get_it.dart';
import 'package:moga/core/bloc/global_cubit/app_language_cubit.dart';
import 'package:moga/core/database/cache/cache_helper.dart';
import 'package:moga/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

final sl = GetIt.instance;
Future<void> initServiceLocator() async {
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  sl.registerLazySingleton<GlobalCubit>(() => GlobalCubit());
  sl.registerLazySingleton<AuthCubit>(() =>AuthCubit());
  sl.registerLazySingleton<SocialCubit>(() =>SocialCubit());
}
