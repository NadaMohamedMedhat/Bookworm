import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/register_screen/cubit/register_states.dart';
import 'package:graduation_project/network/local_network/Cache_Helper.dart';
import 'package:graduation_project/widgets/reusable_components.dart';

import '../../../models/AuthModels/register_model.dart';
import '../../../network/Remote network/dio_helper.dart';
import '../../../network/Remote network/end_points.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  late RegisterModel registerModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    // ignore: non_constant_identifier_names
    required String password_confirmation,
  }) {
    emit(RegisterLoadingState());

    DioHelper.postData(
      path: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password_confirmation,
      },
    ).then((value) {
      // ignore: avoid_print
      print(value.data);
      registerModel = RegisterModel.fromJson(value.data);
      token=registerModel.token!;
     CacheHelper.saveData(key: 'myToken', value:registerModel.token! );

      emit(RegisterSuccessState(registerModel));
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
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
