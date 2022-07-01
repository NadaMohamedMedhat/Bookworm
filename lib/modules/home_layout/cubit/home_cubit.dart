import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/models/home_model.dart';
import 'package:graduation_project/models/post_wantToReadModel.dart';
import 'package:graduation_project/models/wantToReadModel.dart';

import 'package:graduation_project/modules/home_layout/cubit/home_states.dart';

import '../../../models/delete_book_model.dart';
import '../../../models/get_score_model.dart';
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
      // ignore: avoid_print
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

      // print(homeModel!.data![0].description);
      // print(homeModel!.data![2].name);
      // print(homeModel!.data![1].id);
      // print(homeModel!.status);
      //print(bookModel!.name);

      emit(GetBookDetailsSuccessState(data!));
    }).catchError((error) {
      //print(error.toString());
      emit(GetBookDetailsErrorState());
    });
  }

  PostWantToReadModel? postwantToReadModel;
  List<dynamic> wantToReadList =[];
  bool isIn = true;

  void addToWantToReadSection(String uID, String bookId , String section) {
    emit(AddToWantToReadLoadingState());
    DioHelper.postData(
        path: WANTTOREAD,
        data: {'user_id': uID, 'book_id': bookId , 'section' : section}).then((value) {
      postwantToReadModel = PostWantToReadModel.fromJson(value.data);
      print(postwantToReadModel!.status);
      print(postwantToReadModel!.message);
      isIn = !isIn;
      wantToReadList = [...?homeModel!.data];
      print(wantToReadList[0].id);
      print(wantToReadList[1].id);
      print(wantToReadList[2].id);
      emit(AddToWantToReadSuccessState());
      // print(postwantToReadModel!.result.toString());
      //print(postwantToReadModel!.status.toString());
    }).catchError((error) {
      // print(error.toString());
      emit(AddToWantToReadErrorState());
    });
  }
 Result? levelOne ;
  List levelTwo = [];
  List levelThree = [];

  GetUserScoreModel? getUserScoreModel;
  void getUserScore(dynamic id) {
    emit(GetUserScoreLoadingState());
    DioHelper.getWantToReadData(path: GETSCORE, uID: id).then((value) {
      getUserScoreModel = GetUserScoreModel.fromJson(value.data);
      levelOne = getUserScoreModel!.result!.firstWhere((element) => element.level == '1');
      print(levelOne!.score.toString());
      print(getUserScoreModel!.result![0].score.toString());
      print(getUserScoreModel!.message.toString());
      emit(GetUserScoreSuccessState());
    }).catchError((error) {
      emit(GetUserScoreErrorState());
      print(error.toString());
    });
  }

  DeleteBookModel? deleteBookModel;

  void deleteBook(dynamic id){
    emit(DeleteBookLoadingState());
    DioHelper.deleteData(path: 'https://thebook.tech/api/delete/$id').then((value) {
      emit(DeleteBookSuccessState());
      deleteBookModel = DeleteBookModel.fromJson(value.data);
      print(deleteBookModel!.result.toString());
    }).catchError((error){
      emit(DeleteBookErrorState());
      print(error.toString());
    });
  }
}

