import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormKey = GlobalKey();
  void signIn() async {
    emit(SignInLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailure(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailure(
            errMessage: 'Wrong password provided for that user.'));
      } else {
        emit(SignInFailure(
            errMessage: "there is an error with the code ${e.code}"));
      }
    }
  }
}
