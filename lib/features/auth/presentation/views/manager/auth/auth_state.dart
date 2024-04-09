part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class IsPasswordLoadingState extends AuthState {}

final class IsPasswordSuccessState extends AuthState {}

final class ForgetPasswordLoadingState extends AuthState {}

final class ForgetPasswordSuccessState extends AuthState {}

final class ForgetPasswordFailureState extends AuthState {}

final class RegisterLoadingState extends AuthState {}

final class CreateUserLoadingState extends AuthState {}

final class CreateUserSuccessState extends AuthState {}

final class CreateUserFailureState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterErrorState extends AuthState {
  final String errMessage;

  RegisterErrorState(this.errMessage);
}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginErrorState extends AuthState {}

final class EmailVerifiedState extends AuthState {}

final class EmailIsNotVerifiedState extends AuthState {}
