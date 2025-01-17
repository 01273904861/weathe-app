part of 'sign_in_cubit.dart';


abstract class SignInState {}

final class SignInInitial extends SignInState {}
final class SignInLoading extends SignInState {}
final class SignInFailure extends SignInState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}
final class SignInSuccess extends SignInState {}
