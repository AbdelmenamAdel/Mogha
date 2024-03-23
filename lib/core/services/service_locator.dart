import 'package:get_it/get_it.dart';
import 'package:moga/core/bloc/global_cubit/app_language_cubit.dart';
import 'package:moga/core/database/cache/cache_helper.dart';
import 'package:moga/features/auth/data/firebase/firebase_auth_repo_services_implementation.dart';
import 'package:moga/features/auth/presentation/views/manager/auth/auth_cubit.dart';

final sl = GetIt.instance;
Future<void> initServiceLocator() async {
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  sl.registerLazySingleton<GlobalCubit>(() => GlobalCubit());
  sl.registerLazySingleton<AuthCubit>(() =>AuthCubit(sl.get<AuthRepoImplementation>()));
  sl.registerLazySingleton<AuthRepoImplementation>(() =>AuthRepoImplementation());
}
