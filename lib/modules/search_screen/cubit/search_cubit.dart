import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/home_model.dart';

import 'package:graduation_project/modules/search_screen/cubit/search_states.dart';
import 'package:graduation_project/network/Remote%20network/end_points.dart';

import '../../../network/Remote network/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  // HomeModel? homeModel;
  // //List<SearchModel> items = [];

  // void getSearchData(dynamic text){
  //   emit(SearchLoadingState());
  //   DioHelper.postData(path:SEARCH ,
  //   data: {
  //     'name' : text
  //   }).then((value) {
  //     homeModel = HomeModel.fromJson(value.data);
  //     //items =searchModel as List<SearchModel>;
  //     print(homeModel!.data.toString());
  //     print(homeModel!.data![1].name);
  //     print('Search '+homeModel!.status.toString());
  //     emit(SearchSuccessState());
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(SearchErrorState());
  //   });
  // }

  // SearchModel? searchModel;
  // List allItems =[] ;
  // void getSearchData(keyword){
  //   emit(SearchLoadingState());
  //   DioHelper.getData(path: 'https://thebook.tech/api/page/search?keyword=$keyword',).then((value) {
  //     searchModel = SearchModel.fromJson(value.data);
  //     allItems = [
  //          searchModel!.data,
  //        ];
  //     emit(SearchSuccessState());
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(SearchErrorState());
  //   });
  // }

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
      // year: year
    ).then((value) {
      searchModel = HomeModel.fromJson(value.data);
      // allItems = [
      //      searchModel!.data,
      //    ];
      //allItems = searchModel!.data![0].contains(name.toString());
      print(searchModel!.data![0].name.toString());
      print(searchModel!.data.toString());
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
