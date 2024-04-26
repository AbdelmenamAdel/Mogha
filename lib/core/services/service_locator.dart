import 'package:get_it/get_it.dart';
import 'package:moga/core/bloc/global_cubit/app_language_cubit.dart';
import 'package:moga/core/database/cache/cache_helper.dart';
import 'package:moga/features/auth/data/firebase/firebase_auth_repo_services_implementation.dart';
import 'package:moga/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:moga/features/social/data/get_user_auth_impl.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  sl.registerLazySingleton<GlobalCubit>(() => GlobalCubit());
  sl.registerLazySingleton<AuthCubit>(
      () => AuthCubit(sl.get<AuthRepoImplementation>()));
  sl.registerLazySingleton<SocialCubit>(() => SocialCubit(sl.get<GetUserImplementation>()));
  sl.registerLazySingleton<AuthRepoImplementation>(
      () => AuthRepoImplementation());
  sl.registerLazySingleton<GetUserImplementation>(
      () => GetUserImplementation());
}
