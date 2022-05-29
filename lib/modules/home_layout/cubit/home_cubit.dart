import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/models/home_model.dart';

import 'package:graduation_project/modules/home_layout/cubit/home_states.dart';

import '../../../network/Remote network/dio_helper.dart';
import '../../../network/Remote network/end_points.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;

  void getHomeData() {
    emit(HomeGetDataLoadingState());

    DioHelper.getData(
      path: HOME,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      emit(HomeGetDataSuccessState(homeModel!));
    }).catchError((error) {
      print(error.toString());
      emit(HomeGetDataErrorState());
    });
  }

  HomeModel? data;

  void getBookDetails(int? id) {
    emit(GetBookDetailsLoadingState());

    DioHelper.getData(
      path: HOME,
    ).then((value) {
      data = HomeModel.fromJson(value.data);

      print(homeModel!.data![0].description);
      print(homeModel!.data![2].name);
      print(homeModel!.data![1].id);
      print(homeModel!.status);
      //print(bookModel!.name);

      emit(GetBookDetailsSuccessState(data!));
    }).catchError((error) {
      print(error.toString());
      emit(GetBookDetailsErrorState());
    });
  }
}
