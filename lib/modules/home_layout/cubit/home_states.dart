import 'package:graduation_project/models/category_model.dart';
import 'package:graduation_project/models/home_model.dart';
import 'package:graduation_project/models/search_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeGetDataLoadingState extends HomeStates {}

class HomeGetDataSuccessState extends HomeStates {
  final HomeModel homeModel;

  HomeGetDataSuccessState(this.homeModel);
}

class HomeGetDataErrorState extends HomeStates {}

/////////////////////////////////


class GetBookDetailsLoadingState extends HomeStates {}

class GetBookDetailsSuccessState extends HomeStates {
  final HomeModel data;
  GetBookDetailsSuccessState(this.data);
}

class GetBookDetailsErrorState extends HomeStates {}






////////////////////////
///
class AddToWantToReadLoadingState extends HomeStates {}

class AddToWantToReadSuccessState extends HomeStates {}

class AddToWantToReadErrorState extends HomeStates {}



class GetUserScoreLoadingState extends HomeStates {}

class GetUserScoreSuccessState extends HomeStates {}

class GetUserScoreErrorState extends HomeStates {

}


class DeleteBookLoadingState extends HomeStates {}

class DeleteBookSuccessState extends HomeStates {}

class DeleteBookErrorState extends HomeStates {

}


