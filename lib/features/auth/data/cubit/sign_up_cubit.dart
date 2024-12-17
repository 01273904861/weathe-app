import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  TextEditingController emaillController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey();

  void signUp() async {
    emit(SignUpLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emaillController.text,
        password: passwordController.text,
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(
            errMessage: 'The account already exists for that email.'));
      } else {
        emit(SignUpFailure(
            errMessage: "there is an error with the code ${e.code}"));
      }
    } catch (e) {
      emit(SignUpFailure(
          errMessage: "there is an error with the code ${e.toString()}"));
    }
  }
}
