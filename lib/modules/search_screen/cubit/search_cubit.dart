import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/home_model.dart';

import 'package:graduation_project/modules/search_screen/cubit/search_states.dart';
import 'package:graduation_project/network/Remote%20network/end_points.dart';

import '../../../network/Remote network/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  HomeModel? searchModel;
  List allItems = [];

  void getSearchData(
    String keyword,
    //dynamic year
  ) {
    emit(SearchLoadingState());
    DioHelper.getSearchData(
      path: SEARCH,
      keyword: keyword,
    ).then((value) {
      searchModel = HomeModel.fromJson(value.data);
      print(searchModel!.data![0].name.toString());
      print(searchModel!.data.toString());
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
