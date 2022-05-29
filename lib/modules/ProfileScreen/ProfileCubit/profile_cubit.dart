import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/local_network/Cache_Helper.dart';

import '../../../network/Remote network/dio_helper.dart';
import '../../../network/Remote network/end_points.dart';

import 'Profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  //ProfileModel? userProfile;
  String? name;
  String? email;

  void getUserProfile() {
    emit(ProfileLoadingState());

    DioHelper.getData(
      path: PROFILE,
      token: 'Bearer ${CacheHelper.getData(key: 'myToken')}',
    ).then((value) {
      //userProfile = ProfileModel.fromJson(value.data);
      //"339|RUrnVgoVkaa6EGTUEY7nLOt7js8LQvE26xmxtvX4"
      print(value.data);
      name = value.data['user']['name'];
      email = value.data['user']['email'];
      print(email);
      print(name);
      // print(' success heeeeer');

      emit(ProfileSuccessState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString() + '   errorheeeeer');
      emit(ProfileErrorState(error.toString()));
    });
  }
}
