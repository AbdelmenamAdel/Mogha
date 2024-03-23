import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:moga/features/auth/data/firebase/firebase_auth_repo_services_implementation.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepoImplementation authRepo;
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  GlobalKey<FormState> signupformkey = GlobalKey<FormState>();
  late Either<String, String> res;
  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    res = await authRepo.register(
      email: email,
      password: password,
    );

    res.fold((failure) {
      emit(RegisterErrorState());
    }, (success) {
      emit(RegisterSuccessState());
    });
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    res = await authRepo.login(
      email: email,
      password: password,
    );
    res.fold((failure) {
      emit(LoginErrorState());
    }, (success) {
      emit(LoginSuccessState());
    });
  }
}
