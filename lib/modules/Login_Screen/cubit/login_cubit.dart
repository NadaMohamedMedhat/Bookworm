import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/modules/Login_Screen/cubit/login_states.dart';
import 'package:graduation_project/network/local_network/Cache_Helper.dart';

import '../../../models/AuthModels/login_model.dart';
import '../../../network/Remote network/dio_helper.dart';
import '../../../network/Remote network/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;

  void userLogin({
    // ignore: non_constant_identifier_names
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(
      path: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      // ignore: avoid_print
      print(value.data);
      print(value.data);
      //print(loginModel.user!.id);
      //print(loginModel.user!.id.toString());

      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.saveData(key: 'myToken', value:loginModel.token! );
     //CacheHelper.saveData(key: 'uId', value:loginModel.user!.id! );


      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  bool isPasswordShown = true;
  IconData passwordIcon = Icons.visibility_outlined;

  void showPassword() {
    isPasswordShown = !isPasswordShown;

    passwordIcon = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(PasswordShownSuccess());
  }
}
