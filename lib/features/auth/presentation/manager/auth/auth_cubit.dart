import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moga/features/auth/data/firebase/firebase_auth_repo_services_implementation.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepoImplementation authRepo;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Either<String, String> res;
  bool isPassword = true;
  IconData? secure = Icons.visibility_off;

  void togglePassword() {
    emit(IsPasswordLoadingState());
    isPassword = !isPassword;
    secure = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(IsPasswordSuccessState());
  }

  File? profileImage;
  String? profileImageUrl;

  Future<void> register({
    required String email,
    required String password,
    required String userName,
  }) async {
    emit(RegisterLoadingState());
    res = await authRepo.register(
      email: email,
      password: password,
      userName: userName,
    );
    res.fold((failure) {
      emit(RegisterErrorState(failure));
    }, (success) {
      emit(RegisterSuccessState());
      createUser(
        email: email,
        password: password,
        userName: userName,
        profileImage: profileImage == null ? null: profileImageUrl,
        uId: FirebaseAuth.instance.currentUser!.uid,
        isEmailVerified: FirebaseAuth.instance.currentUser!.emailVerified,
      );
    });
  }

  Future<UserCredential> registerWithGoogle() async {
    return await authRepo.registerWithGoogle();
  }

  var storage = firebase_storage.FirebaseStorage.instance;

  Future<void> uploadProfileImage() async {
    storage
        .ref()
        .child('photos/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImageUrl = value;
        log(profileImageUrl ?? '');
        emit(UploadProfileImageSuccessState());
      }).catchError((error) {
        log(error.toString());
        emit(UploadProfileImageFailureState());
      });
    }).catchError((error) {
      log(error.toString());
      emit(UploadProfileImageFailureState());
    });
  }

  void createUser({
    required String email,
    required String password,
    required String userName,
    required String uId,
    String? profileImage,
    required bool isEmailVerified,
  }) async {
    emit(CreateUserLoadingState());
    try {
      res = await authRepo.createUser(
        email: email,
        password: password,
        userName: userName,
        uId: uId,
        profilePhoto: profileImage,
        isEmailVerified: isEmailVerified,
      );
      sendEmailVerification();
      emit(CreateUserSuccessState());
    } catch (e) {
      emit(CreateUserFailureState());
    }
  }

  Future<void> forgetPassword({
    required String email,
  }) async {
    emit(ForgetPasswordLoadingState());

    try {
      res = await authRepo.forgetPassword(
        email: email,
      );
      emit(ForgetPasswordSuccessState());
    } catch (e) {
      emit(ForgetPasswordFailureState());
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoadingState());
      res = await authRepo.login(
        email: email,
        password: password,
      );
    } catch (e) {
      log(e.toString());
    }

    res.fold((failure) {
      emit(LoginErrorState());
    }, (success) {

      log(success);
      emit(LoginSuccessState());
    });
  }

  Future<void> sendEmailVerification() async {
    await authRepo.sendEmailVerification();
    debugPrint('email send');
  }

  Future<bool> isEmailVerified() async {
    try {
      bool res = await authRepo.isEmailVerified();
      emit(EmailVerifiedState());
      return res;
    } catch (e) {
      emit(EmailIsNotVerifiedState());
      return false;
    }
  }
}
