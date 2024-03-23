import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moga/features/auth/data/firebase/firebase_auth_repo_services.dart';

class AuthRepoImplementation implements FirebaseAuthRepository {
  AuthRepoImplementation();

   UserCredential? user;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Either<String, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return const Right('Login Sussefully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return const Left('Wrong password provided for that user.');
      } else {
        return Left(e.code.toString());
      }
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> register({
    required String email,
    required String password,
  }) async {
    try {
      user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return const Right('registered Sussefully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week-password') {
        debugPrint('week password');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('email is already exist');
      }
      return Left(e.toString());
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> forgetPassword({
    required String email,
  }) async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Code is sended sucessfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left('No user found for that email.');
      } else {
        return Left(e.code.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
