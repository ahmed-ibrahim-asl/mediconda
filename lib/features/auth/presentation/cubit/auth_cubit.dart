import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  bool isLogin = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void changeIsLogin() {
    isLogin = !isLogin;
    emit(AuthChangeLoginState());
  }
  bool validateData()=>formKey.currentState!.validate();
  authUser(){
    final isValid = validateData();
    if(isValid){
      if(isLogin){
loginUser();
      }else{
        registerUser();
      }
    }
  }
  loginUser(){
    log('Login User');
    log(emailController.text);
    log(passwordController.text);
    emit(AuthSuccessState());
  }
  registerUser(){
    log('Register User');
    log(nameController.text);
    log(emailController.text);
    log(passwordController.text);
    log(phoneController.text);
    emit(AuthSuccessState());

  }
}
