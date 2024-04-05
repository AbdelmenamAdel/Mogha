import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthRepository {
  Future<Either<String, String>> login({
    required String email,
    required String password,
  });

  Future<Either<String, String>> register({
    required String email,
    required String password,
  });
  Future<UserCredential> registerWithGoogle();

  Future<Either<String, String>> forgetPassword({
    required String email,
  });
}
